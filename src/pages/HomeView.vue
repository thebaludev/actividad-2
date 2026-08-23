<script setup lang="ts">
import { computed, reactive } from 'vue'
import PetFilters from '../components/PetFilters.vue'
import PetCard from '../components/PetCard.vue'
import { mascotasSample } from '../data/mascotas.sample'
import type { Filtros } from '../types/mascota'

const mascotas = mascotasSample

const filtros = reactive<Filtros>({
  busqueda: '',
  especie: 'todas',
  tamano: 'todos',
  ciudad: 'todas',
})

const ciudades = [...new Set(mascotas.map((m) => m.ciudad))]

const mascotasFiltradas = computed(() =>
  mascotas.filter((m) => {
    const texto = filtros.busqueda.trim().toLowerCase()
    const coincideBusqueda =
      texto === '' || m.nombre.toLowerCase().includes(texto) || m.raza.toLowerCase().includes(texto)
    const coincideEspecie = filtros.especie === 'todas' || m.especie === filtros.especie
    const coincideTamano = filtros.tamano === 'todos' || m.tamano === filtros.tamano
    const coincideCiudad = filtros.ciudad === 'todas' || m.ciudad === filtros.ciudad
    return (
      coincideBusqueda && coincideEspecie && coincideTamano && coincideCiudad && m.estado !== 'adoptado'
    )
  })
)
</script>

<template>
  <section class="bg-bosque-500 py-16 text-arena-50">
    <div class="mx-auto max-w-6xl px-6">
      <h1 class="font-display text-4xl leading-tight sm:text-5xl">
        Cada mascota tiene<br />una casa esperando por ella
      </h1>
      <p class="mt-4 max-w-xl text-bosque-100">
        Conoce a las mascotas disponibles para adopción en refugios aliados y encuentra a tu próximo
        compañero.
      </p>
    </div>
  </section>

  <section class="mx-auto max-w-6xl px-6 py-10">
    <PetFilters
      v-model:busqueda="filtros.busqueda"
      v-model:especie="filtros.especie"
      v-model:tamano="filtros.tamano"
      v-model:ciudad="filtros.ciudad"
      :ciudades="ciudades"
    />

    <p class="mt-6 text-sm text-carbon-600">{{ mascotasFiltradas.length }} mascota(s) disponibles</p>

    <div class="mt-4 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
      <PetCard v-for="m in mascotasFiltradas" :key="m.id" :mascota="m" />
    </div>

    <p v-if="mascotasFiltradas.length === 0" class="mt-10 text-center text-carbon-600">
      No encontramos mascotas con esos filtros. Intenta ampliar la búsqueda.
    </p>
  </section>
</template>
