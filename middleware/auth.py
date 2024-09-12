from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import redirect, HttpResponse

class AuthMiddleware(MiddlewareMixin):
    # 中间件
    def process_request(self, request):
        #排除不需要登录就可以访问的页面
        #获取当前用户请求的URL
        public_paths = ['/intro/','/login/','/register/']  # 添加不需要登录的路径
        if request.path_info in public_paths:
            print(request.session.get('user_id'))
            print("白名单请求")
            return

        # 读取用户当前访问的session信息
        if request.session.get('user_id'):
            # print("放行")
            return  

        # 没有登录信息，回到登陆页面
        print("拒绝")
        return redirect('/intro/')

    def process_response(self, request, response):
        return response
