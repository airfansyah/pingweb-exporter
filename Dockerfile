FROM --platform=linux/amd64 nginx:1.14.2
RUN apt update -y && apt install -y cron && apt install jq -y && apt install curl -y
RUN mkdir -p /pingweb-exporter
COPY system/pingweb.sh ./pingweb-exporter/pingweb.sh
COPY system/index.html /usr/share/nginx/html/index.html
COPY system/start.sh  ./
COPY system/cron /etc/cron.d/cron
RUN chmod 0644 /etc/cron.d/cron
RUN chmod 0700 /start.sh
RUN crontab /etc/cron.d/cron
RUN touch /var/log/cron.log
CMD ./start.sh
