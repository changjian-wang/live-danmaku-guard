# 🛡️ LiveDanmakuGuard - 直播弹幕卫士

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![.NET](https://img.shields.io/badge/.NET-8.0-512BD4)](https://dotnet.microsoft.com/)
[![Vue](https://img.shields.io/badge/Vue-3.4+-4FC08D)](https://vuejs.org/)
[![Electron](https://img.shields.io/badge/Electron-Latest-47848F)](https://www.electronjs.org/)

多平台直播弹幕监控与水军分析工具，帮助主播和运营人员识别和管理直播间中的水军行为。

## ✨ 功能特性

- 🖥️ **多直播间监控** - 同时监控多个直播间的弹幕流
- 🔍 **智能水军识别** - 基于行为模式识别可疑账号
- 🏷️ **关键词高亮** - 自定义敏感词过滤和高亮显示
- 📊 **数据分析可视化** - Dashboard实时数据展示
- 📝 **报告导出** - 支持Excel和PDF格式报告生成
- 🌐 **跨平台支持** - Web应用 + Electron桌面客户端
- 🔔 **实时通知** - WebSocket实时推送异常行为提醒
- 👤 **用户画像** - 详细的平台用户行为分析

## 🚀 支持平台

| 平台 | 状态 | 优先级 |
|------|------|--------|
| **Bilibili** | 🔄 开发中 | P0 |
| **抖音** | 📋 规划中 | P1 |
| **快手** | 💭 未来计划 | P2 |

## 🛠️ 技术栈

### 前端
- **框架**: Vue 3.4+ (Composition API + TypeScript)
- **构建工具**: Vite 5+
- **UI组件库**: Naive UI
- **图表库**: ECharts
- **状态管理**: Pinia
- **路由**: Vue Router 4
- **HTTP客户端**: Axios
- **实时通信**: @microsoft/signalr
- **桌面客户端**: Electron
- **样式**: TailwindCSS

### 后端
- **运行时**: .NET 8.0
- **Web框架**: ASP.NET Core
- **实时通信**: SignalR
- **数据库**: SQLite + Entity Framework Core
- **认证**: JWT Bearer
- **日志**: Serilog
- **API文档**: Swagger/OpenAPI

## 📦 快速开始

### 环境要求

- .NET 8.0 SDK
- Node.js 18+ (推荐 20.x)
- npm 或 yarn 或 pnpm

### 克隆仓库

```bash
git clone https://github.com/changjian-wang/live-danmaku-guard.git
cd live-danmaku-guard
```

### 启动后端

```bash
cd src/backend
dotnet restore
dotnet run --project LiveDanmakuGuard.Api
```

后端API将在 `http://localhost:5000` 启动

### 启动前端

```bash
cd src/frontend/live-danmaku-guard-web
npm install
npm run dev
```

前端应用将在 `http://localhost:5173` 启动

### 使用Docker

```bash
docker-compose up -d
```

## 📁 项目结构

```
live-danmaku-guard/
├── src/
│   ├── backend/              # .NET 8 后端项目
│   │   ├── LiveDanmakuGuard.Api/         # Web API 入口
│   │   ├── LiveDanmakuGuard.Core/        # 核心业务逻辑
│   │   ├── LiveDanmakuGuard.Auth/        # 认证授权
│   │   ├── LiveDanmakuGuard.Platforms/   # 平台协议对接
│   │   ├── LiveDanmakuGuard.Data/        # 数据访问层
│   │   └── LiveDanmakuGuard.Tests/       # 单元测试
│   └── frontend/             # Vue 3 + Electron 前端
│       └── live-danmaku-guard-web/
├── docs/                     # 项目文档
│   ├── plan/                 # 开发计划
│   ├── guide/                # 使用指南
│   └── development/          # 开发文档
├── scripts/                  # 构建脚本
└── docker-compose.yml        # Docker编排配置
```

## 📋 开发计划

详细的开发计划和任务清单请查看 [docs/plan/](./docs/plan/)

### 当前里程碑

- ✅ M0: 项目初始化
- 🔄 M1: 认证系统开发
- 📋 M2: Bilibili协议对接
- 📋 M3: 核心功能实现
- 📋 M4: 数据分析功能
- 📋 M5: 报告导出功能
- 📋 M6: Electron桌面客户端
- 📋 M7: Docker部署优化
- 📋 M8: 抖音平台支持

## 📖 文档

- [快速开始](./docs/guide/快速开始.md)
- [开发环境搭建](./docs/development/开发环境搭建.md)
- [项目概述](./docs/plan/01-项目概述.md)
- [技术架构](./docs/plan/02-技术架构.md)
- [功能规划](./docs/plan/03-功能规划.md)
- [API设计](./docs/plan/05-API设计.md)

## 🤝 贡献

欢迎贡献代码、报告问题或提出建议！

1. Fork 本仓库
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

## 📄 开源协议

本项目采用 MIT 协议开源 - 详见 [LICENSE](LICENSE) 文件

## 👨‍💻 作者

**Changjian Wang**

- GitHub: [@changjian-wang](https://github.com/changjian-wang)

## 🙏 致谢

感谢所有直播平台提供的开放协议和社区贡献者的支持！

## ⚠️ 免责声明

本工具仅用于学习和研究目的，请遵守各直播平台的服务条款和用户协议。使用本工具产生的任何后果由使用者自行承担。
