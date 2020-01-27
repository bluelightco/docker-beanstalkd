FROM alpine:3.7

ENV MAX_JOB_SIZE 65535

RUN apk add --no-cache beanstalkd

RUN mkdir -p /data

EXPOSE 11300

ENTRYPOINT ["/usr/bin/beanstalkd"]
CMD ["-z $MAX_JOB_SIZE"]