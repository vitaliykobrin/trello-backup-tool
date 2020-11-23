FROM php:7.4-cli

RUN apt-get update \
	&& apt-get install --no-install-recommends -y gettext cron \
	&& rm -rf /var/lib/apt/lists/*

COPY trello-backup-app /usr/src/script
COPY trello-backup-config.php.sample /usr/src/script
COPY scripts /usr/src/script

WORKDIR /usr/src/script

CMD ./prepare-config.sh && ./set-up-backup-by-schedule.sh && tail -f /dev/null
