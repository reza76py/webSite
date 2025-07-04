from django.urls import path
from .views import MessageView

urlpatterns = [
    path('api/message/', MessageView.as_view(), name='post-message'),
]
