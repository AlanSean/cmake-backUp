# CMake in windows or MacOS or linux

CMake下载地址: https://cmake.org/download/


[Effective Modern CMake](https://gist.github.com/mbinna/c61dbb39bca0e4fb7d1f73b0d66a4fd1)


## 环境win10

找到cmake 安装目录


### window上安装 libjpeg

0. [下载页](http://www.ijg.org/) 下载  jpegsr9d.zip 解压

1. 找到jconfig.vc，复制并改名为jconfig.h，否则会产生无法生成jconfig的警告

2. 找到makefile.vc这个文件, 第十二行代码`!include <win32.mak>` 改为电脑路径你电脑上的路径

3. 有的电脑木有,所以自己写个[win32.mak](https://github.com/AlanSean/cmake-backUp/blob/main/win32.mak)

4. 开始栏 搜索 VS2015 x86 Native Tools Command Prompt 打开 进入 libjpeg目录 运行命令 nmake -f makefile.vc


#### jpegoptim在window环境编译时-运行NMAKE时，报错 找不到CMake 实例

问题: could not find any instance of Visual Studio.CMake

1. 打开 Visual Studio Installer 
2. 工作负载下 选中  c++的桌面开发、通用windows平台开发 和 Visual Studio 扩展开发
3. 单个组件下 选中 <用于CMake和Linux的Visual C++工具>和<用于CMake的Visual C++工具>
4. 重启 修复了
