FROM python:3.7-alpine

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app

# bash is needed to run the polynote script
RUN apk add --no-cache bash openjdk8 curl
RUN apk add --no-cache --virtual .build-deps gcc g++ freetype-dev
RUN pip3 install jep jedi pyspark virtualenv matplotlib
RUN curl -L https://github.com/polynote/polynote/releases/download/0.2.8/polynote-dist.tar.gz \
  | tar -xzvpf -

COPY config.yml ./polynote/config.yml

EXPOSE 8192

CMD bash polynote/polynote
