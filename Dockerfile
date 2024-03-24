FROM python:3

WORKDIR /usr/src/app

RUN apt update
RUN apt install -y build-essential
RUN apt install -y ruby ruby-dev rubygems
RUN gem install compass

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python ./setup.py --skipdeps

ENV DJANGO_SETTINGS_MODULE=hvz.settings
CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]
