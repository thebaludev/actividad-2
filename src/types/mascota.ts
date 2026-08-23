export type Especie = 'perro' | 'gato' | 'conejo' | 'ave' | 'otro'
export type EstadoAdopcion = 'disponible' | 'en_proceso' | 'adoptado'
export type Tamano = 'pequeno' | 'mediano' | 'grande'

export interface Mascota {
  id: number
  nombre: string
  especie: Especie
  raza: string
  edad: number
  sexo: 'macho' | 'hembra'
  tamano: Tamano
  ciudad: string
  refugio: string
  descripcion: string
  vacunado: boolean
  esterilizado: boolean
  aptoNinos: boolean
  estado: EstadoAdopcion
  fechaIngreso: string
  imagenPrincipal: string
  imagenes: string[]
}

export interface Comentario {
  id: number
  mascotaId: number
  autor: string
  texto: string
  fecha: string
}

export interface Filtros {
  busqueda: string
  especie: Especie | 'todas'
  tamano: Tamano | 'todos'
  ciudad: string
}
