FROM nginx:1.19.1

RUN apt-get update && \
    apt-get install -y fcgiwrap gfortran

# Fix fcgi-wrap executable bit.
RUN sed -i 's/www-data/nginx/' /etc/init.d/fcgiwrap
COPY conf/default.conf /etc/nginx/conf.d/default.conf

# Copy and compile source code.
COPY fortran /fortran
RUN cd /fortran && \
    for file in $(ls *.f); do gfortran -o "${file%.*}" $file; done

COPY cgi-bin /usr/share/nginx/html/cgi-bin/

# Add executable bit.
RUN chmod -R +x /usr/share/nginx/html/cgi-bin/

CMD /etc/init.d/fcgiwrap start \
    && nginx -g 'daemon off;'
