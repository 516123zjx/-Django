from django.apps import AppConfig
import threading



class App0Config(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "app0"
    # 在应用启动时启动后台任务线程
    def ready(self):
        # 确保所有应用都已加载再引入
        from . import views, API
        # 这种方式是直接将模块当做参数传入函数
        thread = threading.Thread(target=views.orderCircleProcesser)
        thread.daemon = True  # 设置为守护线程，使其在主线程结束时自动结束
        thread.start()