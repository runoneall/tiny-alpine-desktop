### 任务清单

- [x] 在基于 alpine:latest 的系统上进行构建
- [x] 登录用户为 user，密码通过环境变量 $USER_PASSWD 设置，默认密码为 user
- [x] 使用 icewm
- [x] 安装 xrdp 用于访问
- [x] 不安装浏览器
- [x] 安装 sudo 作为 user 用户使用 root 权限的方式
- [x] 暴露 rdp 端口，xrdp 监听 rdp 端口
- [x] 取消暴露 vnc 端口，xrdp 使用 Xvnc 进行登录
- [x] 将 .xsession, xrdp.ini 和 sesman.ini 放入外部文件
- [x] 新建一个 Dockerfile 存储修改，文件名直接为 `Dockerfile`
- [x] 将更改通过 git 提交到存储库 runoneall/tiny-alpine-desktop，推送到 main 分支
- [x] 打包 Docker 镜像
- [x] 将镜像提交到 runoneall/tiny-alpine-desktop
