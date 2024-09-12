from django.db import models

# Create your models here.

class User(models.Model):
    # 用户表
    name = models.CharField(verbose_name="用户名",max_length=64)
    password = models.CharField(verbose_name="密码",max_length=64)
    email = models.CharField(verbose_name="电子邮箱",max_length=64)
    profile = models.CharField(verbose_name="头像路径",max_length=256)

class Order(models.Model):
    # 订单表
    user = models.ForeignKey(verbose_name="订单用户",to="User",to_field="id",on_delete=models.CASCADE)
    state_choice = (
        (0,"未完成"),
        (1,"已完成"),
        (2,"识别失败"),
    )
    state = models.IntegerField(verbose_name="订单状态",choices=state_choice)
    type_choice = (
        (0,"摄影计划助手模块"),
        (1,"摄影博客编写助手模块"),
    )
    type = models.IntegerField(verbose_name="订单类型",choices=type_choice)
    created_time = models.DateTimeField(verbose_name="创建时间")
    finished_time = models.DateTimeField(verbose_name="结束时间")
    extra_info = models.TextField(verbose_name="额外信息")
    answer = models.TextField(verbose_name="处理结果")

class Image(models.Model):
    # 订单图片资源表
    order = models.ForeignKey(verbose_name="所属订单",to="Order",to_field="id",on_delete=models.CASCADE)
    image_info = models.CharField(verbose_name="图片描述",max_length=64)
    path = models.CharField(verbose_name="图片路径",max_length=256)