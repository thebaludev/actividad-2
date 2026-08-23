<script setup lang="ts">
import { mascotasSample } from '../../data/mascotas.sample'
import type { Mascota } from '../../types/mascota'

const mascotas = mascotasSample

const estadoLabel: Record<Mascota['estado'], string> = {
  disponible: 'Disponible',
  en_proceso: 'En proceso',
  adoptado: 'Adoptado',
}
</script>

<template>
  <div class="mx-auto max-w-6xl px-6 py-10">
    <div class="flex items-center justify-between">
      <h1 class="font-display text-2xl text-carbon-900">Panel de administración</h1>
      <RouterLink
        :to="{ name: 'admin-mascota-nueva' }"
        class="rounded bg-bosque-500 px-4 py-2 text-sm font-medium text-arena-50 hover:bg-bosque-600"
      >
        + Nueva mascota
      </RouterLink>
    </div>

    <div class="mt-6 overflow-x-auto rounded-lg border border-bosque-100 bg-white">
      <table class="w-full text-left text-sm">
        <thead class="border-b border-bosque-100 text-carbon-600">
          <tr>
            <th class="px-4 py-3 font-medium">Nombre</th>
            <th class="px-4 py-3 font-medium">Especie</th>
            <th class="px-4 py-3 font-medium">Refugio</th>
            <th class="px-4 py-3 font-medium">Estado</th>
            <th class="px-4 py-3 font-medium">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="m in mascotas" :key="m.id" class="border-b border-bosque-100 last:border-0">
            <td class="px-4 py-3">{{ m.nombre }}</td>
            <td class="px-4 py-3 capitalize">{{ m.especie }}</td>
            <td class="px-4 py-3">{{ m.refugio }}</td>
            <td class="px-4 py-3">{{ estadoLabel[m.estado] }}</td>
            <td class="px-4 py-3">
              <RouterLink
                :to="{ name: 'admin-mascota-editar', params: { id: m.id } }"
                class="text-bosque-500 hover:underline"
              >
                Editar
              </RouterLink>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
