import os
from pathlib import Path
from dotenv import load_dotenv
import dj_database_url

# プロジェクトのベースディレクトリ
BASE_DIR = Path(__file__).resolve().parent.parent

# ローカル用環境変数ファイルを読み込む（存在すれば）
env_path = BASE_DIR / '.env.local'
if env_path.exists():
    load_dotenv(dotenv_path=env_path)

# 環境変数取得
SECRET_KEY = os.environ.get('SECRET_KEY', 'insecure-key-for-dev')
DEBUG = os.environ.get('DEBUG', 'False') == 'True'
ALLOWED_HOSTS = os.environ.get('ALLOWED_HOSTS', 'localhost,127.0.0.1').split(',')

OPENAI_API_KEY = os.environ.get('OPENAI_API_KEY')

# アプリ定義
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'projects',
    'employees',
    # 追加したアプリがあればここに書く
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',  # 静的ファイル用
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'ses_site.middleware.LoginRequiredMiddleware',  # 独自ミドルウェア
]

ROOT_URLCONF = 'ses_site.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'ses_site.wsgi.application'

# =========================
# データベース設定
# =========================
DATABASE_URL = os.environ.get('DATABASE_URL')

if DATABASE_URL:
    # DATABASE_URLがある場合はこれを使う（本番環境用）
    DATABASES = {
        'default': dj_database_url.parse(DATABASE_URL, conn_max_age=600),
    }
else:
    # ローカル環境用（.env.localのDATABASE_URLが未設定ならSQLite）
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': BASE_DIR / 'db.sqlite3',
        }
    }

# パスワードバリデーション
AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',},
]

# 国際化設定
LANGUAGE_CODE = 'ja'
TIME_ZONE = 'Asia/Tokyo'
USE_I18N = True
USE_L10N = True
USE_TZ = True

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# ログイン関連URL
LOGIN_URL = '/login/'
LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/login/'

# 静的ファイル設定
STATIC_URL = '/static/'

# 本番環境（Render）かローカル/EC2かを環境変数で判定
if os.environ.get('RENDER') == 'true':
    # Render 環境（書き込み可能なパスに保存）
    STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
else:
    # ローカル or AWS EC2 環境（/home/ubuntu に保存）
    STATIC_ROOT = '/home/ubuntu/SES_project/staticfiles'

# whitenoise（静的ファイルを本番で配信）
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'