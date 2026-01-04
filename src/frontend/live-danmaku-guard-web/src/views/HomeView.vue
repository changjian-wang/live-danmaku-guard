<template>
  <div class="home-view min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-100">
    <div class="apple-card p-8 max-w-2xl text-center">
      <h1 class="text-4xl font-bold text-gray-800 mb-4">
        🛡️ LiveDanmakuGuard
      </h1>
      <p class="text-xl text-gray-600 mb-8">
        直播弹幕卫士 - 多平台直播弹幕监控与水军分析工具
      </p>
      <div class="space-y-4">
        <p class="text-gray-600">
          ✨ 功能特性：多直播间监控 | 智能水军识别 | 数据分析可视化
        </p>
        <p class="text-gray-600">
          🚀 支持平台：Bilibili (开发中) | 抖音 (规划中)
        </p>
      </div>
      <div class="mt-8">
        <button class="apple-button-primary">
          开始使用
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
// Home view component
</script>

<style scoped>
.home-view {
  animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
