// Type definitions for the application

export interface User {
  id: string
  username: string
  email: string
}

export interface DanmakuMessage {
  id: string
  userId: string
  username: string
  message: string
  timestamp: Date
  platform: string
}

export interface LiveRoom {
  id: string
  roomId: string
  platform: string
  title: string
  isMonitoring: boolean
}

// Add more types as needed
