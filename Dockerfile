FROM alpine:3.11

ENV MAX_JOB_SIZE 65535

RUN apk add --no-cache beanstalkd=1.11-r0

RUN addgroup -S beanstalkd \
    && adduser -S -G beanstalkd beanstalkd \
    && mkdir -p /data \
    && chown beanstalkd:beanstalkd /data

EXPOSE 11300

CMD ["sh", "-c", "beanstalkd -u beanstalkd -b /data -z $MAX_JOB_SIZE"]
