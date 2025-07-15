from django.shortcuts import redirect
from django.conf import settings
import re

EXEMPT_URLS = [re.compile(settings.LOGIN_URL.lstrip('/'))]

class LoginRequiredMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        if hasattr(settings, 'LOGIN_EXEMPT_URLS'):
            self.exempt_urls = [re.compile(url) for url in settings.LOGIN_EXEMPT_URLS]
            self.exempt_urls += EXEMPT_URLS
        else:
            self.exempt_urls = EXEMPT_URLS

    def __call__(self, request):
        if not request.user.is_authenticated:
            path = request.path_info.lstrip('/')
            if not any(m.match(path) for m in self.exempt_urls):
                return redirect(settings.LOGIN_URL)
        return self.get_response(request)
