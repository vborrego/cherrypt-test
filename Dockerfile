FROM ubuntu:latest
RUN apt update
RUN apt install -y nano vim python curl
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py > get-pip.py
RUN python get-pip.py
RUN pip install cherrypy routes --user
RUN mkdir /app
COPY . /app/
WORKDIR /app
CMD ["python","main.py"]
