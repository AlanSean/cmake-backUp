# docker-crossbuild-cmake-tools

cmake toolchain file

## build-win
`cmake -DCMAKE_TOOLCHAIN_FILE=/tools/win.cmake`
## build-osx
`cmake -DCMAKE_TOOLCHAIN_FILE=/tools/osx.cmake`
## build-linux
`cmake -DCMAKE_TOOLCHAIN_FILE=/tools/linux.cmake`


## Dockerfile 


```
FROM multiarch/crossbuild
RUN cd /
RUN git clone https://github.com/AlanSean/docker-crossbuild-cmake-tools
RUN mv docker-crossbuild-cmake-tools /tools

```
## docker env
- multiarch/crossbuild: https://github.com/multiarch/crossbuild