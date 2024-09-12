from django.shortcuts import render,HttpResponse,redirect,render
from django.http import JsonResponse
from django.conf import settings
from app0 import API
from app0.models import User,Order,Image
from functools import wraps
import os,hashlib,time
from django.utils import timezone




# 装饰器
def login_required(view_func):
    @wraps(view_func)
    def wrapped_view(request, *args, **kwargs):
        if 'user_id' not in request.session:
            return redirect('/intro/')  # 重定向到登录页面
        return view_func(request, *args, **kwargs)
    return wrapped_view





# 将文件对象保存到文件系统
# ifmd5表示是否以md5名存入
def file_store(file_object,  ifmd5,  file_dir,  file_dir_url):
    if not ifmd5:
        file_full_path = os.path.join(file_dir, file_object.name)
        with open(file_full_path, mode='wb') as f:
            for chunk in file_object.chunks():
                f.write(chunk)
        file_url = file_dir_url + file_object.name
        return ({'file_full_path':file_full_path,'file_url':file_url,'image_info':file_object.name})
    else:
        # 创建一个md5哈希对象
        md5 = hashlib.md5()
        # 对于每个对象, 更新到md5对象中, 逐步计算md5值
        for chunk in file_object.chunks():
            md5.update(chunk)
        # 计算并获取文件内容md5, 新名称 = md5值 + 拓展名
        md5_filename = md5.hexdigest() + os.path.splitext(file_object.name)[1]
        # 创建文件的完整路径
        file_full_path = os.path.join(file_dir, md5_filename)
        # 打开指定路径的文件进行写操作, 如果文件不存在, 将创建一个新文件
        with open(file_full_path, mode='wb') as f:
            # 逐块读取文件内容,将每块内容写入打开的文件中
            for chunk in file_object.chunks():
                f.write(chunk)
        # 生成文件URL
        file_url = file_dir_url + md5_filename
        return ({'file_full_path':file_full_path,'file_url':file_url,'image_info':file_object.name})


# 设置订单循环监听处理器
def orderCircleProcesser():
    while True:
        time.sleep(3)
        # print("正在执行订单处理器")
        orderProcesser()


# 发起监听及单订单处理器
def orderProcesser():
    # print("正在监听待处理订单:")
    processing_order = Order.objects.filter(state = 0).first()
    # 处理摄影计划助手订单
    if not processing_order:
        # print('暂无待处理订单,系统空闲')
        return HttpResponse("执行完成")
    # 处理摄影计划助手订单
    if processing_order.type==0:
        print('开始处理0类单,id:  '+str(processing_order.id))
        # 从img表中找到订单号对应的img
        processing_img_list = Image.objects.filter(order=processing_order.id)
        processing_img = processing_img_list.first()
        # print('找到了img,其对应id为: ' + str(processing_img.id))
        # 处理地标结果
        processing_order.extra_info = API.baidu_landmark(processing_img.path)
        # 先假定失败, 再继续处理
        processing_order.state = 2
        # 地标如果有结果再继续
        if processing_order.extra_info:
            processing_order.answer = API.zhipu_plan_helper(processing_img.path,processing_order.extra_info)
            if processing_order.answer:
                processing_order.state = 1
    # 处理摄影博客编写助手订单
    if processing_order.type==1:
        print('开始处理1类单,id:'+str(processing_order.id))
        # TODO:处理摄影博客编写助手订单
        # 从img表中找到订单关联img
        processing_img_list = Image.objects.filter(order=processing_order.id)
        # 遍历所有关联img, 将full路径全部添加到img_path_list
        img_path_list = []
        for processing_img in processing_img_list:
            # print('找到了img,id为: ' + str(processing_img.id))
            img_path_list.append(processing_img.path)
        # 调用API
        # 处理订单的extraingo等于地标识别
        processing_order.answer = API.zhipu_blog_helper(img_path_list,processing_order.extra_info)
        processing_order.state=1
    # 设置结束时间
    processing_order.finished_time=str(timezone.now())
    # 将订单更新回数据库
    processing_order.save()
    # 输出结果
    # print("结果为:  " + processing_order.answer)
    print("结束时间:  " + str(processing_order.finished_time))








# 初始界面
# @login_required
def initial(request):
    return render(request,"initial.html")


# 测试函数
def test(request):
    print("正在执行测试函数")
    orderProcesser()
    print("测试函数执行完毕")
    return HttpResponse("执行完成")







# 注册事件
def register(request):
    if request.method == "POST":
        name = request.POST.get("name")
        email = request.POST.get("email")
        password = request.POST.get("password")
        confirm_password = request.POST.get("confirm_password")

        if password != confirm_password:
            return JsonResponse({"error": "密码和确认密码不匹配"})

        if User.objects.filter(name=name).exists():
            return JsonResponse({"error": "用户名已存在"})
        
        # 分配默认头像
        profile = os.path.join(settings.MEDIA_ROOT, "default.png")
        User.objects.create(name=name,email=email, password=password, profile=profile)
        return JsonResponse({"success": "注册成功"})

    return JsonResponse({"error": "非法请求"})


# 登陆事件
def login(request):
    if request.method == "POST":
        name = request.POST.get('name')
        password = request.POST.get('password')
        print(name)
        print(password)

        user = User.objects.filter(name=name,password=password).first()

        if user is not None:
            request.session['user_id'] = user.id # 保存用户ID到session
            # request.session['user_id'] = {'id': user.id} # 保存用户ID到session
            return JsonResponse({'success':'登录成功'})
        else:
            return JsonResponse({'error':'用户名或密码错误'})
    return JsonResponse({'error':'非法请求'})


# 修改密码事件
def update_password(request):
    if request.method == "POST":
        password = request.POST.get("password")
        new_password = request.POST.get("new_password")
        new_confirm_password = request.POST.get("new_confirm_password")
        # 根据session提取用户id
        id = request.session['user_id']
        if not password or not new_password or not new_confirm_password:
            return JsonResponse({"error": "请填写完整"})
        # 确认密码匹配
        if new_password != new_confirm_password:
            return JsonResponse({"error": "密码和确认密码不匹配"})
        # 检测非法账号
        if not User.objects.filter(id=id).exists():
            return JsonResponse({"error": "非法账号,请重新登陆"})
        # 检测用户密码
        if not User.objects.filter(id=id).first().password==password:
            return JsonResponse({"error": "原密码错误"})
        # 更新用户密码
        User.objects.filter(id=id).update(
            password = new_password,
        )
        return JsonResponse({"success": "修改成功"})


# 修改name事件
def update_name(request):
    if request.method == "POST":
        new_name = request.POST.get("new_name")
        print(f'新名字是{new_name}')
        # 根据session提取用户id
        id = request.session['user_id']
        if not new_name:
            return JsonResponse({"error": "请填写完整"})
        # 检测非法账号
        if not User.objects.filter(id=id).exists():
            return JsonResponse({"error": "非法账号,请重新登陆"})
        # 检测用户名是否已存在
        if User.objects.filter(name=new_name).exists():
            return JsonResponse({"error": "该用户名已存在"})
        # 更新用户姓名
        User.objects.filter(id=id).update(
            name = new_name,
        )
        return JsonResponse({"success": "修改成功"})

# 修改email事件
def update_email(request):
    if request.method == "POST":
        new_email = request.POST.get("new_email")
        print(f'新邮箱是{new_email}')
        # 根据session提取用户id
        id = request.session['user_id']
        if not new_email:
            return JsonResponse({"error": "请填写完整"})
        # 检测非法账号
        if not User.objects.filter(id=id).exists():
            return JsonResponse({"error": "非法账号,请重新登陆"})
        # 更新用户邮箱
        User.objects.filter(id=id).update(
            email = new_email,
        )
        return JsonResponse({"success": "修改成功"})


# 退出登录
def logout(request):
    if request.method == 'GET':
        request.session.flush()  # 清除会话
        return redirect('/intro/')


# 处理头像更新
def update_profile(request):
    if request.method == "POST":
        upload_info_list =[]
        type = request.POST.get('type')
        file_objects = request.FILES.getlist('avatars')  # 获取所有上传的文件
        if not file_objects:
            return JsonResponse({'error': '缺少文件'}, status=400)
        try:
            # 获取用户id
            id = request.session['user_id']
            # 获取用户对象, 用于Order的外键
            user_object = User.objects.filter(id=id).first()
            # 若媒体目录不存在则创建
            if not os.path.exists(settings.MEDIA_ROOT):
                os.makedirs(settings.MEDIA_ROOT)
            for file_object in file_objects:
                # 将文件对象保存到文件系统并返回相关信息
                store_info = file_store(file_object,True,settings.MEDIA_ROOT,settings.MEDIA_URL)
                upload_info_list.append(store_info)
                # 更新数据库:img
                user_object.profile = str(store_info['file_full_path'])
                user_object.save()
            return JsonResponse({'message': '头像修改成功','upload_info_list':upload_info_list})
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': '请求方法错误'}, status=400)










# 指引界面: 登陆注册
def intro(request):
    if request.method == "GET":
        return render(request,"intro.html")


# 帮助页界面
# @login_required
def help(request):
    if request.method == "GET":
        return render(request,"help.html")


# 摄影计划助手
# @login_required
def plan(request):
    if request.method == "GET":
        return render(request, "plan.html")


# 博客编写助手
# @login_required
def write(request):
    if request.method == "GET":
        return render(request, "write.html")


# 个人中心
# @login_required
def personal(request):
    if request.method == "GET":
        id = request.session['user_id']
        
        profile_url = User.objects.get(id=id).profile.replace(str(settings.BASE_DIR),'').replace('\\','/')
        user_name = User.objects.get(id=id).name
        email = User.objects.get(id=id).email
        if request.method == "GET":
            return render(request,"personal.html",{'profile_url':profile_url,'user_name':user_name,'uid':id,'email':email})













# 创建订单
# 通过ajax post请求
def order_create(request):
    if request.method == "POST":
        upload_info_list =[]
        type = request.POST.get('type')
        extra_info = request.POST.get('extra_info')
        file_objects = request.FILES.getlist('avatars')  # 获取所有上传的文件
        if not file_objects:
            return JsonResponse({'error': '缺少文件'}, status=400)
        try:
            # TODO:更新数据库:order
            # 获取用户id
            id = request.session['user_id']
            # 获取用户对象, 用于Order的外键
            user_object = User.objects.filter(id=id).first()
            # 创建语句
            if type=='1':
                order_object = Order.objects.create(
                    user = user_object,
                    state=0,
                    created_time=timezone.now(),
                    finished_time=timezone.now(),
                    type=type,
                    extra_info = extra_info,
                )
            else:
                order_object = Order.objects.create(
                    user = user_object,
                    state=0,
                    created_time=timezone.now(),
                    finished_time=timezone.now(),
                    type=type,
                    extra_info = "",
                )
            # 若媒体目录不存在则创建
            if not os.path.exists(settings.MEDIA_ROOT):
                os.makedirs(settings.MEDIA_ROOT)
            for file_object in file_objects:
                # 将文件对象保存到文件系统并返回相关信息
                store_info = file_store(file_object,True,settings.MEDIA_ROOT,settings.MEDIA_URL)
                upload_info_list.append(store_info)
                # 更新数据库:img
                Image.objects.create(
                    order = order_object,
                    image_info = str(store_info['image_info']),
                    path = str(store_info['file_full_path']),
                )
            return JsonResponse({'message': '订单创建成功! 稍后请在历史记录查看处理结果','upload_info_list':upload_info_list})
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': '请求方法错误'}, status=400)


# 获取历史记录
def get_history(request):
    # 用于存储该用户的历史记录
    user_history=[]
    type=int(request.body.decode('utf-8'))
    # print('type 是 :' + str(type))
    # 取出所有关联的order对象
    id = request.session['user_id']
    order_objects = Order.objects.filter(user=id,type=type)
    for order_object in order_objects:
        history_item = {
            "id":order_object.id,
            "created_time":order_object.created_time,
            "finished_time":order_object.finished_time,
            "state":order_object.state,
            "extra_info":order_object.extra_info,
            }
        user_history.append(history_item)
    return JsonResponse({"success": user_history})

# 根据传来的订单id返回订单
def get_answer(request):
    id = request.POST.get('order_id')
    # print('订单id为' + id)
    id = int(id)
    # 校验用户是否有查看该订单的权利
    user_id = request.session['user_id']
    order_object = Order.objects.get(id=id)
    # 获取订单相关图片URL
    img_list = Image.objects.filter(order=id)
    url_list = []
    for img in img_list:
        img_url = img.path.replace(str(settings.BASE_DIR),'').replace('\\','/')
        # print("图片路径为" + img_url)
        url_list.append({'url':img_url,'image_info':img.image_info})
    if not user_id==order_object.user_id:
        return JsonResponse({'error':'您的用户没有查看该订单的权限'})
    return JsonResponse({
        'success':{
            'answer':order_object.answer,
            'extra_info':order_object.extra_info,
            'type':order_object.type,
            'url_list': url_list
            }
        })


# 根据传来的订单id删除订单
def delete_order(request):
    id = request.POST.get('order_id')
    # print('订单id为' + id)
    id = int(id)
    # 校验用户是否有删除该订单的权利
    user_id = request.session['user_id']
    order_object = Order.objects.get(id=id)
    if not user_id==order_object.user_id:
        return JsonResponse({'error':'您的用户没有删除该订单的权限'})
    # 记录订单类型
    type = order_object.type
    order_object.delete()
    return JsonResponse({'success':{'type':type}})





