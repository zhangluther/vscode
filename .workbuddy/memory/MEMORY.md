# 项目长期记忆 — VSCode 二次开发

## 项目概况
- 路径:/Users/zhangwei/Development/vscode(VSCode 源码)
- 目标:基于 VSCode 源码做定制版编辑器二次开发

## 二次开发需求清单
1. 去除 VSCode / 微软品牌名
2. 修改 logo
3. 去掉登录功能
4. 去掉部分按键与侧边栏图标
5. 修改开始页信息
6. 菜单汉化
7. 修改默认主题色
8. 增加默认插件

## 关键修改位置索引
- 品牌名:product.json、package.json、README.md、resources/{linux,win32}/*.desktop/.appdata.xml/.rc
- Logo:resources/darwin/code.icns、resources/linux/code.png、resources/win32/*.ico
- 登录:src/vs/workbench/contrib/authentication/、extensions/{github,microsoft}-authentication/、product.json(defaultChatAgent / trustedExtensionAuthAccess)
- 活动栏/侧边栏:src/vs/workbench/browser/parts/activitybar/activitybarPart.ts、各 contrib 模块的 *.contribution.ts
- 开始页:src/vs/workbench/contrib/welcomeGettingStarted/(gettingStarted.ts / startupPage.ts / gettingStartedList.ts / gettingStarted.contribution.ts)
- 菜单汉化:src/vs/code/electron-main/app.ts、src/vs/workbench/services/menubar/、src/vs/platform/menubar/、nls(src/vs/nls.ts)+ 中文语言包
- 主题:extensions/theme-defaults/themes/*.json、src/vs/workbench/contrib/themes/、src/vs/platform/theme/、product.json(onboardingThemes)
- 默认插件:product.json(builtInExtensions)、extensions/、build/ 打包脚本

## 架构分层(src/vs,自底向上)
- L1 base:基础库与通用工具(事件/DOM/生命周期/链表等)
- L2 platform:平台核心服务(配置/文件/IPC/主题/日志/扩展管理)
- L3 editor:Monaco 编辑器核心(可独立复用)
- L4 workbench:完整 IDE 界面(二次开发主战场,含 browser/parts、contrib、services)
- L5 code / server:应用入口(Electron 主进程 / 浏览器 / 远程服务器)
