from django.shortcuts import render,HttpResponse,redirect,render
from django.http import JsonResponse
from django.conf import settings
import os,json
from zhipuai import ZhipuAI
import base64
import requests

# 智谱APIkey
ZHIPU_KEY = "6e1426877db663072a7fd1bd72c4ba5d.jFEM4hAFoJe4e6P4"


# 图像转为base64url
def image_to_base64_url(img_path):
    with open(img_path, "rb") as image_file:
        # 读取图片数据
        image_data = image_file.read()
        # 将图片数据转换为base64编码
        base64_data = base64.b64encode(image_data).decode("utf-8")
        # 构造data URL
        base64_url = f"data:image/png;base64,{base64_data}"
        return base64_url

# 智谱多段文本聊天
def zhipu_talk(request):
    client = ZhipuAI(api_key=ZHIPU_KEY) # 填写您自己的APIKey
    response = client.chat.completions.create(
        model="glm-4",  # 填写需要调用的模型名称
        messages=[
            {"role": "user", "content": "作为一名营销专家，请为我的产品创作一个吸引人的slogan"},
            {"role": "assistant", "content": "当然，为了创作一个吸引人的slogan，请告诉我一些关于您产品的信息"},
            {"role": "user", "content": "智谱AI开放平台"},
            {"role": "assistant", "content": "智启未来，谱绘无限一智谱AI，让创新触手可及!"},
            {"role": "user", "content": "创造一个更精准、吸引人的slogan"}
        ],
    )
    return HttpResponse(response.choices[0].message)


# 根据图片返回摄影简记
def zhipu_img_note(img_path):
    client = ZhipuAI(api_key=ZHIPU_KEY)
    try:
        response = client.chat.completions.create(
            model="glm-4v",  # 填写需要调用的模型名称
            messages=[
            {
                "role": "user",
                "content": [
                {
                    "type": "text",
                    "text": "该图这是我的摄影记录,图片名是" + os.path.basename(img_path) +",请你结合图片名和图片内容,严格按照以下形式生成摄影简记,要求内容精简,不超过100字,且不要联想图片以外的事情:在地点:...。我的经历:...。"
                },
                {
                    "type": "image_url",
                    "image_url": {
                        "url" : image_to_base64_url(img_path)
                    }
                }
                ]
            }
            ]
        )
        return response.choices[0].message.content
    except Exception as e:
        return "暂无简记"


# 智谱根据摄影简记生成摄影博客
def zhipu_blog_helper(img_path_list,extra_info):
    # 创建问题
    question = "你扮演我的摄影博客编写助手, 我将逐个发给你我的摄影简记, 请帮我生成一篇摄影笔记, 简记如下:"
    # 填充摄影简记
    for img_path in img_path_list:
        # 传入本地图片路径列表
        question += zhipu_img_note(img_path)
    # 填充额外要求
    if extra_info:
        question += '。另外我对你输出的摄影博客有额外需求如下:'
        question += extra_info
    print(question)
    client = ZhipuAI(api_key=ZHIPU_KEY)
    try:
        response = client.chat.completions.create(
            model="glm-4v",  # 填写需要调用的模型名称
            messages=[
            {
                "role": "user",
                "content": [
                {
                    "type": "text",
                    "text": question
                }
                ]
            }
            ]
        )
        return response.choices[0].message.content
    except Exception as e:
        return ""



# 智谱根据图片生成摄影博客
def zhipu_plan_helper(img_path,landmark):
    # 创建问题
    question = "你扮演我的摄影计划助手, 请你根据我提供的地标名'" + landmark + "',和该地标图片为我生成摄影计划,要求包含:摄影器材推荐,摄影时间推荐,分析地形光线等特征生成摄影角度推荐。"
    client = ZhipuAI(api_key=ZHIPU_KEY)
    try:
        response = client.chat.completions.create(
            model="glm-4v",  # 填写需要调用的模型名称
            messages=[
            {
                "role": "user",
                "content": [
                {
                    "type": "text",
                    "text": question
                },
                {
                    "type": "image_url",
                    "image_url": {
                        "url" : image_to_base64_url(img_path)
                    }
                }
                ]
            }
            ]
        )
        return response.choices[0].message.content
    except Exception as e:
        return ""




# 获取百度地标api
def get_access_token():
    API_KEY = "v7wRaK7WMlpf3SRmpHZb5Wr7"
    SECRET_KEY = "dWp5pRbzQHWPYbmuzJqTkR7eKnVj8ZC0"
    """
    使用 AK，SK 生成鉴权签名（Access Token）
    :return: access_token，或是None(如果错误)
    """
    url = "https://aip.baidubce.com/oauth/2.0/token"
    params = {"grant_type": "client_credentials", "client_id": API_KEY, "client_secret": SECRET_KEY}
    return str(requests.post(url, params=params).json().get("access_token"))

# 百度地标识别
def baidu_landmark(img_path):
    # print("地标图像:"+img_path)
    request_url = "https://aip.baidubce.com/rest/2.0/image-classify/v1/landmark"
    # 二进制方式打开图片文件
    params = {"image":base64.b64encode(open(img_path, 'rb').read())}
    access_token = get_access_token()
    request_url = request_url + "?access_token=" + access_token
    headers = {'content-type': 'application/x-www-form-urlencoded'}
    try:
        response = requests.post(request_url, data=params, headers=headers)
        # return json.dumps(response.json(), ensure_ascii=False) # 返回json字符串
        return response.json()['result']['landmark']
    except Exception as e:
        return ""