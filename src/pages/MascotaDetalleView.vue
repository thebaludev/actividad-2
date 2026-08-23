<script setup lang="ts">
import { computed, ref } from 'vue'
import { useRoute } from 'vue-router'
import CommentList from '../components/CommentList.vue'
import { mascotasSample } from '../data/mascotas.sample'

const route = useRoute()
const mascotaId = computed(() => Number(route.params.id))
const mascota = computed(() => mascotasSample.find((m) => m.id === mascotaId.value))

const atributos = computed(() => {
  if (!mascota.value) return []
  return [
    { label: 'Vacunado', valor: mascota.value.vacunado },
    { label: 'Esterilizado', valor: mascota.value.esterilizado },
    { label: 'Apto con niños', valor: mascota.value.aptoNinos },
  ]
})

const solicitudEnviada = ref(false)
function solicitarAdopcion() {
  solicitudEnviada.value = true
}
</script>

<template>
  <div v-if="mascota" class="mx-auto max-w-4xl px-6 py-10">
    <RouterLink to="/" class="text-sm text-bosque-500 hover:underline">&larr; Volver al listado</RouterLink>

    <div class="mt-6 grid gap-8 md:grid-cols-2">
      <div>
        <img
          :src="mascota.imagenPrincipal"
          :alt="mascota.nombre"
          class="w-full rounded-lg object-cover"
        />
        <div v-if="mascota.imagenes.length" class="mt-3 grid grid-cols-3 gap-2">
          <img
            v-for="(img, i) in mascota.imagenes"
            :key="i"
            :src="img"
            class="h-20 w-full rounded object-cover"
          />
        </div>
      </div>

      <div>
        <h1 class="font-display text-3xl text-carbon-900">{{ mascota.nombre }}</h1>
        <p class="mt-1 text-carbon-600">
          {{ mascota.raza }} · {{ mascota.edad }} años · {{ mascota.sexo === 'macho' ? 'Macho' : 'Hembra' }}
        </p>
        <p class="mt-1 text-sm text-carbon-600">{{ mascota.ciudad }} · {{ mascota.refugio }}</p>

        <p class="mt-4 leading-relaxed text-carbon-900">{{ mascota.descripcion }}</p>

        <ul class="mt-6 flex flex-wrap gap-2">
          <li
            v-for="a in atributos"
            :key="a.label"
            class="rounded-full px-3 py-1 text-xs font-medium"
            :class="a.valor ? 'bg-bosque-100 text-bosque-600' : 'bg-arena-100 text-carbon-600'"
          >
            {{ a.label }}: {{ a.valor ? 'sí' : 'no' }}
          </li>
        </ul>

        <button
          v-if="!solicitudEnviada"
          @click="solicitarAdopcion"
          class="mt-8 w-full rounded bg-bosque-500 px-4 py-3 font-medium text-arena-50 transition-colors hover:bg-bosque-600 sm:w-auto"
        >
          Quiero adoptar a {{ mascota.nombre }}
        </button>
        <p v-else class="mt-8 rounded bg-bosque-100 px-4 py-3 text-sm text-bosque-600">
          Tu solicitud fue registrada. El refugio se pondrá en contacto contigo pronto.
        </p>
      </div>
    </div>

    <CommentList :mascota-id="mascota.id" class="mt-12 block" />
  </div>

  <div v-else class="mx-auto max-w-4xl px-6 py-20 text-center text-carbon-600">
    No encontramos esta mascota.
  </div>
</template>
