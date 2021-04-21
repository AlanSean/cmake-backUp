## 了解docker

[docker](https://github.com/AlanSean/book/tree/master/10-docker):https://github.com/AlanSean/book/tree/master/10-docker


## 编写Dockerfile

```Dockerfile
FROM multiarch/crossbuild
RUN cd /
RUN git clone https://github.com/AlanSean/docker-crossbuild-cmake-tools
RUN mv docker-crossbuild-cmake-tools/ /tools
```

## 创建镜像

`docker build -f Dockerfile -t crossenv . --no-cache`

## 运行镜像

`docker run --rm -it -v E:\github\cmake-backUp\mozjpeg-4.0.3:/workdir crossenv`

## 开始编译 mozjpeg

```bash#workdir

mkdir build
mkdir build/win
mkdir build/mac
mkdir build/linux


cd build/win
//交叉编译win程序
//-D 后面跟的是参数
//-DCMAKE_TOOLCHAIN_FILE 指定编译工具链文件
//-DPNG_SUPPORTED 是mozjpeg的参数 不设置0 会报错
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=/tools/win.cmake -DPNG_SUPPORTED=0
//等待
//-- Configuring done
//-- Generating done
make

// cjpeg.exe  这个是需要动态链接库的 也就是依赖xxx.lib
// cjpeg-static.exe 不需要 便于迁移
// 其他系统平台也是同理

cd build/mac
//注意 工具链换了哦
cmake ../.. -DCMAKE_TOOLCHAIN_FILE=/tools/osx.cmake -DPNG_SUPPORTED=0
make

cd build/linux
cmake ../.. -DPNG_SUPPORTED=0
make
```


## 把docker里面的数据映射到磁盘
```
docker volume create    创建
docker volume inspect   查看
docker volume rm        删除
```