 # nimPkg GIT加速

利用加速源解决nim包管理器nimble `git clone` 过慢的问题

**本仓库PackageList会每小时与官方同步**

## 使用方法
### 推荐
使用工具链unimcli自动链接加速源

`nimble install unimcli`

then:

`unim install pkgname`

### 其他方法

1. [**linux**]创建`~/.config/nimble/nimble.ini`写入以下内容

   [**windows**]创建`C:\Users\<YourUser>\AppData\Roaming\nimble\nimble.ini`写入以下内容

   ```ini
   [PackageList]
   
   name = "official"
   url = "https://raw.fastgit.org/SOVLOOKUP/nimPkg/main/packages.json" 
   # or use originurl
   # url = "https://raw.githubusercontent.com/SOVLOOKUP/nimPkg/main/packages.json"
   ```

2. 输入`nimble refresh`更新缓存

## 其他

原理：利用ucloud提供的GlobalSSH功能，对ssh协议数据进行加速

加速来源：https://github.zhlh6.cn/



## 开发

编译

`nim c -d:ssl -r convert.nim`

arm64:

`nim c -d:ssl --cpu:arm64 --os:linux -r convert.nim`

---



目前国内还没有nim镜像站，该加速方法是我个人使用nimble的权益之计

如果你有意愿参与社区贡献，建立镜像源站，可以与nim中文社区联系

如果你有速度更快更稳定的加速或者镜像源也请随时联系我

