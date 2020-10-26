# Github Client

### Flutter Github Client 项目需求
1. 实现Github账号登录、退出登录功能
2. 登录后可以查看自己的项目主页
3. 支持换肤
4. 支持多语言
5. 登录状态可以持久化；

### 技术选型
- 登录等需要网络使用 dio
- 持久化使用share_preference
- 语言\主题\登录 全局状态共享
- Intl包的使用支持国际化

### 项目结构
 ```
 github_client
 ├── android
 ├── fonts
 ├── i18n
 ├── images
 ├── ios
 └── lib
     ├── common
     ├── net
     ├── util
     ├── i18n
     ├── models
     ├── states
     ├── routes
     └── widgets
 └── test

 ```
### 项目开发

1. 定义创建目录,导入常用工具
2. 封装网络库
3. 根据协议数据 用插件生成 json对象类,创建getter\setter
4. 全局配置
5. 全局监听封装


