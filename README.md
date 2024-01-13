# Learn about flutter, django with various materials for S1

Quiz App (Flutter + Django) : 
<br/>
[https://youtube.com/playlist?list=PLsGh7Wc318kjAd93kqSw9O4xGuu4BZAHZ&si=TvYRGX0a3C11yO3t]
<br/>
Carrot Market Cloning App (Flutter) : 
<br/>
[https://youtube.com/playlist?list=PLgRxBCVPaZ_3R0h7mCkLJ1RKh7XRvoZdF&si=vgfZa2yC4IO6QsEE]
<br/><br/>
<pre><code>
'''python
python -m venv 가상환경이름  #가상환경 생성
source venv/Scripts/activate  #가상환경 실행
pip install django djangorestframework  #장고 설치
django-admin startproject 프로젝트이름  #프로젝트 생성
cd 프로젝트이름
python manage.py startapp 앱이름  #앱 생성
# 앱 실행
python manage.py makemigrations 
python manage.py migrate
python manage.py runserver

# super user 계정 생성
python manage.py createsuperuser

# Heroku 배포를 위한 과정
pip install django-cors-headers gunicorn psycopg2-binary whitenoise dj-database-url

django-cors-headers  #cors 에러 방지
gunicorn  #배포를 위한 도구
psycopg2-binary, dj-database-url  #Heroku에서 사용하는 DB인 postgresql을 위한 것
whitenoise  #정적 파일의 사용을 돕는 미들웨어

# 추가적인 과정 영상에서 확인
'''
</code></pre>
