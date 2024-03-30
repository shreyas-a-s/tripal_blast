ARG drupalversion='10.2.x-dev'
ARG phpversion='8.3'
ARG pgsqlversion="16"
FROM tripalproject/tripaldocker:drupal${drupalversion}-php${phpversion}-pgsql${pgsqlversion}-noChado

COPY . /var/www/drupal/web/modules/contrib/tripal_blast

## Install NCBI Blast+.
RUN cd / \
  && wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.30/ncbi-blast-2.2.30+-x64-linux.tar.gz \
  && tar xzf ncbi-blast-2.2.30+-x64-linux.tar.gz \
  && cp ncbi-blast-2.2.30+/bin/* /usr/local/bin

## Enable module
WORKDIR /var/www/drupal/web/modules/contrib/tripal_blast
RUN service postgresql restart \
  && drush en tripal_blast --yes
