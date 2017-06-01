FROM centos

COPY . /build
WORKDIR /build

RUN yum -y install wget
RUN wget "https://github.com/begriffs/postgrest/releases/download/v0.4.1.0/postgrest-0.4.1.0-centos.tar.xz"
RUN tar xf "postgrest-0.4.1.0-centos.tar.xz"
RUN ls -la
RUN pwd

EXPOSE 3000

CMD exec postgrest sample.conf