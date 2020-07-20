FROM nginx:stable
MAINTAINER Pokrywkait "przemyslaw.pokrywka@pokrywkait.com"

#install
RUN apt-get -y update && apt-get -y install openssl wget unzip

# setup nginx
RUN rm -rf /etc/nginx/conf.d/*;

RUN sed -i 's/access_log.*/access_log \/dev\/stdout;/g' /etc/nginx/nginx.conf; \
    sed -i 's/error_log.*/error_log \/dev\/stdout info;/g' /etc/nginx/nginx.conf;
#    sed -i 's/^pid/daemon off;\npid/g' /etc/nginx/nginx.conf

RUN mkdir /usr/share/nginx/html/keeweb/

# clone keeweb plugins
RUN wget https://github.com/keeweb/keeweb-plugins/archive/master.zip; \
    unzip master.zip; \
    rm master.zip; \
    mv keeweb-plugins-master/docs /usr/share/nginx/html/keeweb/plugins; \
    rm -rf keeweb-plugins-master \
    rm keeweb/plugins/CNAME

EXPOSE 80

COPY keeweb /usr/share/nginx/html/keeweb
COPY keeweb.conf /etc/nginx/conf.d/
RUN mkdir /usr/share/nginx/keeweb

