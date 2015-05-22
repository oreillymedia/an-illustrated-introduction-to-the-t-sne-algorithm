FROM ipython/scipystack

MAINTAINER IPython Project <ipython-dev@scipy.org>

# VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888 80

ENV USE_HTTP 1

# RUN apt-get install libfreeimage3

# Need this for add-apt below
RUN apt-get install python-software-properties software-properties-common -y

# Moviepy needs this, but sometimes the ppa isn't found
# RUN add-apt-repository ppa:jon-severinsson/ffmpeg
# RUN apt-get update && apt-get install ffmpeg -y

RUN pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip2.7 install -r requirements.txt

RUN unset PASSWORD

RUN mkdir images

# Install nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx


ADD public /var/www/html

ADD start.sh /
RUN chmod u+x /start.sh

CMD ["/start.sh"]
