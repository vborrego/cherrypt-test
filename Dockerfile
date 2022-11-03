FROM alpine:3.16
RUN apk add --update --no-cache python3 py3-pip
RUN pip install cherrypy routes --user
RUN mkdir /app
RUN mkdir /mnt/data
COPY . /app/
WORKDIR /app
CMD ["python3","main.py"]
