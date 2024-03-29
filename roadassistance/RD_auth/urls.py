from django.urls import path

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenBlacklistView,
) 

from RD_auth.views import (
    RegisterView,
    UserView,
)


app_name = "auth"

urlpatterns = [
    path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('logout/', TokenBlacklistView.as_view(), name='token_blacklist'),

    path('register/', RegisterView.as_view(), name='register'),
    path('getUser/', UserView.as_view(), name='getUser'),

]