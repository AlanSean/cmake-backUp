FROM multiarch/crossbuild
# 切换国内源 Switching to China Source
# RUN echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list
# RUN echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list
# RUN echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list
# RUN apt-get update

RUN cd /
RUN git clone https://github.com/AlanSean/docker-crossbuild-cmake-tools
RUN mv docker-crossbuild-cmake-tools/ /tools

