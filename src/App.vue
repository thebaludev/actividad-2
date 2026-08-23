<script setup lang="ts">
import AppHeader from './components/AppHeader.vue'
</script>

<template>
  <div class="flex min-h-screen flex-col">
    <AppHeader />
    <main class="flex-1">
      <RouterView />
    </main>
    <footer class="border-t border-bosque-100 py-6 text-center text-sm text-carbon-600">
      Proyecto Actividad 2 - Directorio de mascotas en adopción
    </footer>
  </div>
</template>
