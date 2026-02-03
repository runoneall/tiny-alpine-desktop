阅读 Dockerfile.debian-icewm-vnc 内的代码，对其进行修改，你将完成所有代码的编写，所有操作都使用工具自动完成

- 在基于 alpine:latest 的系统上进行构建
- 登录用户为 user，密码通过环境变量 $USER_PASSWD 设置，默认密码为 user

- 使用 icewm
- 安装 xrdp 用于访问
- 不安装浏览器
- 安装 sudo 作为 user 用户使用 root 权限的方式

- 暴露 rdp 端口，xrdp 监听 rdp 端口
- 取消暴露 vnc 端口，xrdp 使用 Xvnc 进行登录

- 将 .xsession 和 xrdp.ini 放入外部文件
- 新建一个 Dockerfile 存储修改，文件名直接为 `Dockerfile`

- 将更改通过 git 提交到存储库 runoneall/tiny-alpine-desktop，推送到 main 分支
- 打包 Docker 镜像
- 将镜像提交到 runoneall/tiny-alpine-desktop