<script setup lang="ts">
import { ref, computed } from 'vue'
import { comentariosSample } from '../data/mascotas.sample'

const props = defineProps<{ mascotaId: number }>()

// Datos mock por el momento
const comentarios = ref([...comentariosSample])

const comentariosDeMascota = computed(() =>
  comentarios.value.filter((c) => c.mascotaId === props.mascotaId)
)

const nuevoComentario = ref('')
const nuevoAutor = ref('')

function enviarComentario() {
  if (!nuevoComentario.value.trim()) return
  comentarios.value.push({
    id: comentarios.value.length + 1,
    mascotaId: props.mascotaId,
    autor: nuevoAutor.value.trim() || 'Anónimo',
    texto: nuevoComentario.value.trim(),
    fecha: new Date().toISOString().slice(0, 10),
  })
  nuevoComentario.value = ''
  nuevoAutor.value = ''
}
</script>

<template>
  <div>
    <h2 class="font-display text-xl text-carbon-900">Preguntas y comentarios</h2>

    <ul class="mt-4 space-y-3">
      <li
        v-for="c in comentariosDeMascota"
        :key="c.id"
        class="rounded-lg border border-bosque-100 bg-white p-4"
      >
        <div class="flex items-center justify-between text-sm">
          <span class="font-medium text-carbon-900">{{ c.autor }}</span>
          <span class="text-carbon-600">{{ c.fecha }}</span>
        </div>
        <p class="mt-1 text-carbon-900">{{ c.texto }}</p>
      </li>
      <li v-if="comentariosDeMascota.length === 0" class="text-sm text-carbon-600">
        Aún no hay comentarios.
      </li>
    </ul>

    <form
      @submit.prevent="enviarComentario"
      class="mt-6 space-y-3 rounded-lg border border-bosque-100 bg-white p-4"
    >
      <input
        v-model="nuevoAutor"
        type="text"
        placeholder="Tu nombre (opcional)"
        class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
      />
      <textarea
        v-model="nuevoComentario"
        rows="3"
        placeholder="Escribe tu pregunta o comentario..."
        class="w-full rounded border border-bosque-100 px-3 py-2 text-sm focus:border-bosque-500 focus:outline-none"
      ></textarea>
      <button
        type="submit"
        class="rounded bg-bosque-500 px-4 py-2 text-sm font-medium text-arena-50 hover:bg-bosque-600"
      >
        Enviar comentario
      </button>
    </form>
  </div>
</template>
