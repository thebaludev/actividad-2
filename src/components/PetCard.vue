<script setup lang="ts">
import type { Mascota } from '../types/mascota'

defineProps<{ mascota: Mascota }>()

const estadoLabel: Record<Mascota['estado'], string> = {
  disponible: 'Disponible',
  en_proceso: 'En proceso',
  adoptado: 'Adoptado',
}

const estadoClase: Record<Mascota['estado'], string> = {
  disponible: 'bg-bosque-500 text-arena-50',
  en_proceso: 'bg-ambar-400 text-carbon-900',
  adoptado: 'bg-carbon-600 text-arena-50',
}
</script>

<template>
  <RouterLink
    :to="{ name: 'mascota-detalle', params: { id: mascota.id } }"
    class="group block overflow-hidden rounded-lg border border-bosque-100 bg-white transition-shadow hover:shadow-md"
  >
    <div class="relative aspect-4/3 overflow-hidden">
      <img
        :src="mascota.imagenPrincipal"
        :alt="mascota.nombre"
        class="h-full w-full object-cover transition-transform duration-300 group-hover:scale-105"
      />
      <span
        class="absolute left-3 top-3 rounded-full px-3 py-1 text-xs font-medium"
        :class="estadoClase[mascota.estado]"
      >
        {{ estadoLabel[mascota.estado] }}
      </span>
    </div>
    <div class="p-4">
      <h3 class="font-display text-lg text-carbon-900">{{ mascota.nombre }}</h3>
      <p class="text-sm text-carbon-600">{{ mascota.raza }} · {{ mascota.edad }} años</p>
      <p class="mt-1 text-sm text-carbon-600">{{ mascota.ciudad }}</p>
    </div>
  </RouterLink>
</template>
