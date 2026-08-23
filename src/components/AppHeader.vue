<script setup lang="ts"></script>

<template>
  <header class="bg-bosque-500 text-arena-50">
    <div class="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
      <RouterLink to="/" class="font-display text-2xl tracking-tight">
        Meet Your Pet
      </RouterLink>
      <nav class="flex items-center gap-6 text-sm font-medium">
        <RouterLink to="/" class="transition-colors hover:text-ambar-400">Adoptar</RouterLink>
        <RouterLink to="/admin" class="transition-colors hover:text-ambar-400">Panel admin</RouterLink>
      </nav>
    </div>
  </header>
</template>
