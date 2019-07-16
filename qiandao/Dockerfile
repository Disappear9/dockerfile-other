FROM alpine AS builder

ADD . /app

RUN apk --no-cache add unzip \
    && wget https://github.com/binux/qiandao/archive/master.zip \
    && unzip master.zip \
    && mkdir -p /app \
    && cp -R qiandao-master/* /app \
    && sed -i 's/.database.db/app\/data\/database.db/g' /app/config.py \
    && mv /app/qiandao/start.sh /app/start.sh \
    && rm -rf /app/qiandao \
    && mkdir -p /app/data

FROM python:2.7-alpine AS release
LABEL maintainer "Disappear9 <disappear9@outlook.com>"

COPY --from=builder /app /app
WORKDIR /app

RUN apk update \
    && apk add bash autoconf g++ \
    && pip install --no-cache-dir -r requirements.txt

CMD ["/app/start.sh"]
