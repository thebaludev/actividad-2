<script setup lang="ts">
import { computed, reactive } from 'vue'
import { useRoute } from 'vue-router'
import { mascotasSample } from '../../data/mascotas.sample'
import type { Mascota } from '../../types/mascota'

const route = useRoute()
const esEdicion = computed(() => route.name === 'admin-mascota-editar')
const mascotaExistente = computed(() =>
  esEdicion.value ? mascotasSample.find((m) => m.id === Number(route.params.id)) : undefined
)

const formulario = reactive<Omit<Mascota, 'id' | 'imagenes'>>({
  nombre: mascotaExistente.value?.nombre ?? '',
  especie: mascotaExistente.value?.especie ?? 'perro',
  raza: mascotaExistente.value?.raza ?? '',
  edad: mascotaExistente.value?.edad ?? 0,
  sexo: mascotaExistente.value?.sexo ?? 'macho',
  tamano: mascotaExistente.value?.tamano ?? 'mediano',
  ciudad: mascotaExistente.value?.ciudad ?? '',
  refugio: mascotaExistente.value?.refugio ?? '',
  descripcion: mascotaExistente.value?.descripcion ?? '',
  vacunado: mascotaExistente.value?.vacunado ?? false,
  esterilizado: mascotaExistente.value?.esterilizado ?? false,
  aptoNinos: mascotaExistente.value?.aptoNinos ?? false,
  estado: mascotaExistente.value?.estado ?? 'disponible',
  fechaIngreso: mascotaExistente.value?.fechaIngreso ?? new Date().toISOString().slice(0, 10),
  imagenPrincipal: mascotaExistente.value?.imagenPrincipal ?? '',
})

function guardar() {
  console.log('Guardar mascota', formulario)
}
</script>

<template>
  <div class="mx-auto max-w-2xl px-6 py-10">
    <h1 class="font-display text-2xl text-carbon-900">
      {{ esEdicion ? 'Editar mascota' : 'Nueva mascota' }}
    </h1>

    <form @submit.prevent="guardar" class="mt-6 space-y-4 rounded-lg border border-bosque-100 bg-white p-6">
      <div>
        <label class="mb-1 block text-xs font-medium text-carbon-600">Nombre</label>
        <input
          v-model="formulario.nombre"
          type="text"
          required
          class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
        />
      </div>

      <div class="grid grid-cols-2 gap-4">
        <div>
          <label class="mb-1 block text-xs font-medium text-carbon-600">Especie</label>
          <select
            v-model="formulario.especie"
            class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
          >
            <option value="perro">Perro</option>
            <option value="gato">Gato</option>
            <option value="conejo">Conejo</option>
            <option value="ave">Ave</option>
            <option value="otro">Otro</option>
          </select>
        </div>
        <div>
          <label class="mb-1 block text-xs font-medium text-carbon-600">Raza</label>
          <input
            v-model="formulario.raza"
            type="text"
            class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
          />
        </div>
      </div>

      <div class="grid grid-cols-3 gap-4">
        <div>
          <label class="mb-1 block text-xs font-medium text-carbon-600">Edad (años)</label>
          <input
            v-model.number="formulario.edad"
            type="number"
            min="0"
            class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
          />
        </div>
        <div>
          <label class="mb-1 block text-xs font-medium text-carbon-600">Sexo</label>
          <select
            v-model="formulario.sexo"
            class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
          >
            <option value="macho">Macho</option>
            <option value="hembra">Hembra</option>
          </select>
        </div>
        <div>
          <label class="mb-1 block text-xs font-medium text-carbon-600">Tamaño</label>
          <select
            v-model="formulario.tamano"
            class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
          >
            <option value="pequeno">Pequeño</option>
            <option value="mediano">Mediano</option>
            <option value="grande">Grande</option>
          </select>
        </div>
      </div>

      <div class="grid grid-cols-2 gap-4">
        <div>
          <label class="mb-1 block text-xs font-medium text-carbon-600">Ciudad</label>
          <input
            v-model="formulario.ciudad"
            type="text"
            class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
          />
        </div>
        <div>
          <label class="mb-1 block text-xs font-medium text-carbon-600">Refugio</label>
          <input
            v-model="formulario.refugio"
            type="text"
            class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
          />
        </div>
      </div>

      <div>
        <label class="mb-1 block text-xs font-medium text-carbon-600">Descripción</label>
        <textarea
          v-model="formulario.descripcion"
          rows="4"
          class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
        ></textarea>
      </div>

      <div>
        <label class="mb-1 block text-xs font-medium text-carbon-600">Imagen principal (URL)</label>
        <input
          v-model="formulario.imagenPrincipal"
          type="text"
          class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
        />
      </div>

      <div class="flex flex-wrap gap-4 text-sm text-carbon-900">
        <label class="flex items-center gap-2">
          <input v-model="formulario.vacunado" type="checkbox" /> Vacunado
        </label>
        <label class="flex items-center gap-2">
          <input v-model="formulario.esterilizado" type="checkbox" /> Esterilizado
        </label>
        <label class="flex items-center gap-2">
          <input v-model="formulario.aptoNinos" type="checkbox" /> Apto con niños
        </label>
      </div>

      <div>
        <label class="mb-1 block text-xs font-medium text-carbon-600">Estado</label>
        <select
          v-model="formulario.estado"
          class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
        >
          <option value="disponible">Disponible</option>
          <option value="en_proceso">En proceso</option>
          <option value="adoptado">Adoptado</option>
        </select>
      </div>

      <button
        type="submit"
        class="w-full rounded bg-bosque-500 px-4 py-3 font-medium text-arena-50 hover:bg-bosque-600 sm:w-auto"
      >
        Guardar
      </button>
    </form>
  </div>
</template>
