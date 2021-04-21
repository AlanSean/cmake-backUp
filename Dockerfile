FROM multiarch/crossbuild
# China aliyun source
RUN echo deb http://mirrors.aliyun.com/ubuntu/ vivid main restricted universe multiverse > /etc/apt/sources.list
RUN echo deb http://mirrors.aliyun.com/ubuntu/ vivid-security main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb http://mirrors.aliyun.com/ubuntu/ vivid-updates main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb http://mirrors.aliyun.com/ubuntu/ vivid-proposed main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb http://mirrors.aliyun.com/ubuntu/ vivid-backports main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ vivid main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ vivid-security main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ vivid-updates main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ vivid-proposed main restricted universe multiverse >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ vivid-backports main restricted universe multiverse >> /etc/apt/sources.list

# ubuntu source
# RUN deb http://archive.ubuntu.com/ubuntu/ vivid main restricted universe multiverse > /etc/apt/sources.list
# RUN deb http://archive.ubuntu.com/ubuntu/ vivid-security main restricted universe multiverse >> /etc/apt/sources.list
# RUN deb http://archive.ubuntu.com/ubuntu/ vivid-updates main restricted universe multiverse >> /etc/apt/sources.list
# RUN deb http://archive.ubuntu.com/ubuntu/ vivid-proposed main restricted universe multiverse >> /etc/apt/sources.list
# RUN deb http://archive.ubuntu.com/ubuntu/ vivid-backports main restricted universe multiverse >> /etc/apt/sources.list
# RUN deb-src http://archive.ubuntu.com/ubuntu/ vivid main restricted universe multiverse >> /etc/apt/sources.list
# RUN deb-src http://archive.ubuntu.com/ubuntu/ vivid-security main restricted universe multiverse >> /etc/apt/sources.list
# RUN deb-src http://archive.ubuntu.com/ubuntu/ vivid-updates main restricted universe multiverse >> /etc/apt/sources.list
# RUN deb-src http://archive.ubuntu.com/ubuntu/ vivid-proposed main restricted universe multiverse >> /etc/apt/sources.list
# RUN deb-src http://archive.ubuntu.com/ubuntu/ vivid-backports main restricted universe multiverse >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade 
RUN apt-get install libpng-dev

RUN cd /
RUN git clone https://github.com/AlanSean/docker-crossbuild-cmake-tools
RUN mv docker-crossbuild-cmake-tools/ /tools





