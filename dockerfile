FROM python:3.10-slim-bullseye

RUN apt-get update && apt-get install -y nginx

WORKDIR /myApp
COPY nginx.conf /etc/nginx/conf.d/default

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 8000

CMD [ "uvicorn","main:app", "--host" ,"0.0.0.0","--port" ,"8000"]