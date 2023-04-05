FROM rockylinux:9.1

RUN dnf -y install gcc
RUN dnf -y install make
RUN dnf -y install rpm-build
RUN dnf -y install openssl-devel
RUN dnf -y install zlib-devel
RUN curl -o ruby-3.1.2.tar.gz https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz
RUN tar -xzf ruby-3.1.2.tar.gz
WORKDIR /ruby-3.1.2
RUN ./configure --prefix=/usr
RUN make
RUN make install
RUN gem install fpm
COPY ./fpm_buildit.sh /usr/bin
WORKDIR /
RUN rm -rf /ruby-3.1.2
RUN rm -f ruby-3.1.2.tar.gz
CMD ["/bin/bash"]