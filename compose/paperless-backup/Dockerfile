FROM alpine

RUN apk --no-cache add curl jq aws-cli

ADD backup.sh backup.sh
RUN chmod +x backup.sh
ADD crontab /etc/crontabs/root

CMD crond -l 2 -f