import { defineStore } from 'pinia'

// Example store - can be expanded as needed
export const useAppStore = defineStore('app', {
  state: () => ({
    isLoading: false,
    theme: 'light'
  }),
  
  actions: {
    setLoading(loading: boolean) {
      this.isLoading = loading
    },
    setTheme(theme: 'light' | 'dark') {
      this.theme = theme
    }
  }
})
