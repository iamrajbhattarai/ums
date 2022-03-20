from django.conf import settings
from django.conf.urls.static import static
from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .viewset import *

# from api.viewsets.user_viewset import set_csrf_token

router = DefaultRouter()
router.register(r'users', UsersViewsSet)
# router.register(r'permissions',
#                 UserPermissionViewSet, basename="permissions")

urlpatterns = [
    path('', include(router.urls)),
    # used for reset password verification as well
    #     path("verify/", .EmailVerificationView.as_view()),
    path('forgot-password/', ResetPasswordView.as_view(),
         name='password_reset'),
    path('forgot-password-email-check/', ResetPasswordEmailConfirmationView.as_view(),
         name='password_reset_email_check'),
    path('change-password/', ChangePasswordView.as_view(),
         name='password_change'),
    path('login/', LoginView.as_view(), name='user_login'),

]
