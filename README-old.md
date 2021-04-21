# 为啥要写二进制编译 exe程序，CMake minGW练习教程？

前阵子，研究了一下`electron`,想开发一款离线图片压缩桌面程序。写的过程中发现程序在，windows环境下运行没问题，但是在linux 和 macOS会有问题。经常排查发现是node依赖的第三方插件问题(只给了 exe程序)。
所以开始着手研究，如何通过 c++之类的源码，编译出分别对应 Wndows Linux  MacOS的二进制应用程序。
经过一周的时间查阅大量的资料(google)，最终得出下面的流程。

现在只是学会了，编译Linux 和windows的应用程序，但是我想要是 在一个系统环境下分别编译出Windows Linux  MacOS。目前只接触到了 `交叉编译`这个东西。正在着手学习，摸索出完整无坑的流程再继续发相关文章。


[本文存储于github](https://github.com/AlanSean/cmake-backUp)

## 工具准备 

OS： windows 10

CMake: https://cmake.org/

Visual Studio 2019: https://visualstudio.microsoft.com/zh-hans/

## 下载 libpng-1.6.35 源码    Download the libpng-1.6.35 source code

libpng: https://github.com/glennrp/libpng/releases/tag/v1.6.35

解压 libpng-1.6.35.tar.gz

```
directory
|-libpng-1.6.35

```
## 打开 zlib.props  文件，查看依赖zlib的版本

libpng > projects -> vstudio ->  zlib.props 

```
line 34  <ZLibSrcDir>..\..\..\..\zlib-1.2.8</ZLibSrcDir>
```

## 下载 zlib-1.2.8 源码  Download the zlib-1.2.8 source code

zlib : https://github.com/madler/zlib/releases/tag/v1.2.8

解压 zlib-1.2.8.tar.gz
```
directory
|-libpng-1.6.35
|-zlib-1.2.8

```

## 编译 zlib-1.2.8

1. 打开 CMake gui
![1.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6f187ca2fc2a4d0589c54fe16c075ecb~tplv-k3u1fbpfcp-watermark.image)

2. 点击 Browse Source 选择 zlib-1.2.8 

![2.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/ea07cb1c57d7422ca4ba3a03f4fb3a1a~tplv-k3u1fbpfcp-watermark.image)
3. 点击 Browse Build 选择 zlib-1.2.8/build 目录

4. 点击 Configure(生成CMake Cahce) 选择 Visual Studio 
2019 和 x64点击 Finish 等待输出消息  Configuring done

![3.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/30ddfdb095ba42dbaafffbb06c8e2dc7~tplv-k3u1fbpfcp-watermark.image)
5. 点击 Generate(生成Visual Studio的*.sln)  等待输出消息 Generating  done

![4.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3da542091b814c608ba9f4bea4fd2559~tplv-k3u1fbpfcp-watermark.image)
6. 点击 Open Project，会在 Visual Studio 
2019 中打开

7. 生成debug版的静态链接库。
   
    (1). 确认解决方案为debug、X64平台。
    
    (2). 在zlibstatic项目上右击–>生成  等待 输出窗口提示生成成功 (2个)

    (3). zlib的debug、X64版的静态链接库已经编译成功。

    ![5.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3280b06039684e1da05855fdd2c762c4~tplv-k3u1fbpfcp-watermark.image)
8. 生成release版的静态链接库。

    (1). 确认解决方案为release、X64平台。

    (2). 在zlibstatic项目上右击–>生成  等待 输出窗口提示生成成功 (2个)

    (3). zlib的release、X64版的静态链接库已经编译成功。
    
![6.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b1b06e4a7b174bf18a127ba0d82842cd~tplv-k3u1fbpfcp-watermark.image)

9. `最重要的一步 复制  zlib-1.2.8/build/zconf.h 文件到 zlib-1.2.8/`

## 编译 libpng-1.6.35

1. 打开 CMake gui

2. 点击 Browse Source 选择 zlib-1.2.8 

3. 点击 Browse Build 选择 zlib-1.2.8/build 目录

4. 勾选 Advanced, 修改 ZLIB_INCLUDE_DIR,ZLIB_LIBRARY_DEBUG、ZLIB_LIBRARY_RELEASE 后点击 Configure

    ```
    ZLIB_INCLUDE_DIR       C:\c++\zlib-1.2.8
    ZLIB_LIBRARY_DEBUG     C:\c++\zlib-1.2.8\build\Debug\zlibstatic.lib
    ZLIB_LIBRARY_RELEASE   C:\c++\zlib-1.2.8\build\Release\zlibstatic.lib
    ```
   ![7.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/579c49ea039745b4b7a9fff9bbdf7d6b~tplv-k3u1fbpfcp-watermark.image)
5. 单击 Generate，生成Visual Studio 2019的*.sln项目。
6. 点击 Open Project，会在 Visual Studio 2019 中打开

7. 在Visual Studio 2019中分别以Debug和Release方式编译`png_static`项目。



## 编译 mozjpeg-4.0.3

 没有前置依赖  按上面的流程即可

## 我想用 minGW 怎么编译？

1. 在 CMake gui 中，点击 Configure ，选择 “MinGW Makefile” 等待  Configuring done
2. 点击 Generate 等待  Generate done
3. 打开 cmd,执行命令 `cd  C:\c++\zlib-1.2.8\build\`
4. 执行 minGW32-make (每个安装的minGW make命令可能不一样 自行选择即可)


## 编译出来的 exe我单独复制出来不能怎么回事？

因为 应用程序 需要依赖 某个dll，将这个dll 放在和exe程序同一位置即可


## Built on
 - [Github](https://github.com/AlanSean/cmake-backUp)
 - [libpng](http://www.libpng.org/pub/png/libpng.html): libpng is the official PNG reference library. 
 - [zlib](https://github.com/madler/zlib): ZLIB DATA COMPRESSION LIBRARY
 - [mozjpeg](https://github.com/mozilla/mozjpeg): MozJPEG improves JPEG compression efficiency achieving higher visual quality and smaller file sizes at the same time.
 - [CMake](https://cmake.org/): CMake is an open-source, cross-platform family of tools designed to build, test and package software.
 - [Visual Studio 2019](https://visualstudio.microsoft.com/):A full-featured IDE that can be used to code, debug, test, and deploy to any platform.
 - [minGw](http://mingw-w64.org/doku.php):Mingw-w64 is an advancement of the original mingw.org project, created to support the GCC compiler on Windows systems. 
