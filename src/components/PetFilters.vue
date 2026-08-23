<script setup lang="ts">
import type { Especie, Tamano } from '../types/mascota'

defineProps<{ ciudades: string[] }>()

const busqueda = defineModel<string>('busqueda', { required: true })
const especie = defineModel<Especie | 'todas'>('especie', { required: true })
const tamano = defineModel<Tamano | 'todos'>('tamano', { required: true })
const ciudad = defineModel<string>('ciudad', { required: true })
</script>

<template>
  <div class="grid gap-4 rounded-lg border border-bosque-100 bg-white p-4 sm:grid-cols-2 lg:grid-cols-4">
    <div class="lg:col-span-2">
      <label class="mb-1 block text-xs font-medium text-carbon-600">Buscar</label>
      <input
        v-model="busqueda"
        type="text"
        placeholder="Nombre o raza..."
        class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none focus:ring-1 focus:ring-bosque-500"
      />
    </div>
    <div>
      <label class="mb-1 block text-xs font-medium text-carbon-600">Especie</label>
      <select
        v-model="especie"
        class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
      >
        <option value="todas">Todas</option>
        <option value="perro">Perros</option>
        <option value="gato">Gatos</option>
        <option value="conejo">Conejos</option>
        <option value="ave">Aves</option>
        <option value="otro">Otros</option>
      </select>
    </div>
    <div>
      <label class="mb-1 block text-xs font-medium text-carbon-600">Tamaño</label>
      <select
        v-model="tamano"
        class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
      >
        <option value="todos">Todos</option>
        <option value="pequeno">Pequeño</option>
        <option value="mediano">Mediano</option>
        <option value="grande">Grande</option>
      </select>
    </div>
    <div>
      <label class="mb-1 block text-xs font-medium text-carbon-600">Ciudad</label>
      <select
        v-model="ciudad"
        class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
      >
        <option value="todas">Todas</option>
        <option v-for="c in ciudades" :key="c" :value="c">{{ c }}</option>
      </select>
    </div>
  </div>
</template>
