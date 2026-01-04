# 05 - API设计

## 5.1 认证API

| 接口 | 方法 | 路径 | 描述 |
|------|------|------|------|
| 注册 | POST | /api/auth/register | 用户注册 |
| 登录 | POST | /api/auth/login | 用户登录 |
| 刷新Token | POST | /api/auth/refresh | 刷新访问令牌 |
| 登出 | POST | /api/auth/logout | 用户登出 |
| 获取当前用户 | GET | /api/auth/me | 获取当前用户信息 |
| 修改密码 | PUT | /api/auth/password | 修改密码 |
| 更新资料 | PUT | /api/auth/profile | 更新用户资料 |

## 5.2 业务API

### 直播间管理

| 接口 | 方法 | 路径 | 描述 |
|------|------|------|------|
| 获取直播间列表 | GET | /api/rooms | 获取用户的所有直播间 |
| 添加直播间 | POST | /api/rooms | 添加新的直播间 |
| 获取直播间详情 | GET | /api/rooms/{id} | 获取指定直播间详情 |
| 更新直播间 | PUT | /api/rooms/{id} | 更新直播间信息 |
| 删除直播间 | DELETE | /api/rooms/{id} | 删除直播间 |
| 开始监控 | POST | /api/rooms/{id}/monitor | 开始监控 |
| 停止监控 | POST | /api/rooms/{id}/stop | 停止监控 |

### 弹幕管理

| 接口 | 方法 | 路径 | 描述 |
|------|------|------|------|
| 获取弹幕列表 | GET | /api/danmaku | 获取弹幕列表 |
| 获取弹幕详情 | GET | /api/danmaku/{id} | 获取指定弹幕详情 |
| 导出弹幕 | GET | /api/danmaku/export | 导出弹幕数据 |

### 用户分析

| 接口 | 方法 | 路径 | 描述 |
|------|------|------|------|
| 获取用户列表 | GET | /api/users | 获取平台用户列表 |
| 获取用户详情 | GET | /api/users/{id} | 获取用户详情 |
| 标记水军 | PUT | /api/users/{id}/suspicious | 标记为可疑用户 |

### 关键词管理

| 接口 | 方法 | 路径 | 描述 |
|------|------|------|------|
| 获取关键词列表 | GET | /api/keywords | 获取所有关键词 |
| 添加关键词 | POST | /api/keywords | 添加关键词 |
| 更新关键词 | PUT | /api/keywords/{id} | 更新关键词 |
| 删除关键词 | DELETE | /api/keywords/{id} | 删除关键词 |

### 报告管理

| 接口 | 方法 | 路径 | 描述 |
|------|------|------|------|
| 获取报告列表 | GET | /api/reports | 获取所有报告 |
| 生成报告 | POST | /api/reports | 生成新报告 |
| 获取报告详情 | GET | /api/reports/{id} | 获取报告详情 |
| 导出报告 | GET | /api/reports/{id}/export | 导出报告 |
| 删除报告 | DELETE | /api/reports/{id} | 删除报告 |

### 统计分析

| 接口 | 方法 | 路径 | 描述 |
|------|------|------|------|
| Dashboard统计 | GET | /api/stats/dashboard | 获取Dashboard数据 |
| 弹幕频率 | GET | /api/stats/frequency | 获取弹幕频率数据 |
| 用户活跃度 | GET | /api/stats/activity | 获取用户活跃度 |
| 关键词热度 | GET | /api/stats/keywords | 获取关键词统计 |

## 5.3 SignalR Hub接口

### DanmakuHub

```typescript
// 客户端可调用的方法
interface IClientMethods {
  // 订阅直播间弹幕
  SubscribeRoom(roomId: string): Promise<void>;
  
  // 取消订阅
  UnsubscribeRoom(roomId: string): Promise<void>;
}

// 服务端推送的方法
interface IServerMethods {
  // 接收弹幕消息
  ReceiveDanmaku(message: DanmakuMessage): void;
  
  // 连接状态变化
  ConnectionStateChanged(roomId: string, isConnected: boolean): void;
  
  // 异常通知
  ReceiveAlert(alert: Alert): void;
}
```

## 统一响应格式

```typescript
interface ApiResponse<T> {
  success: boolean;
  data?: T;
  message?: string;
  errors?: string[];
  timestamp: string;
}
```

---

**文档版本**: v1.0  
**创建日期**: 2026-01-04
