import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../pages/HomeView.vue'
import MascotaDetalleView from '../pages/MascotaDetalleView.vue'
import AdminMascotasView from '../pages/admin/AdminMascotasView.vue'
import AdminMascotaFormView from '../pages/admin/AdminMascotaFormView.vue'

const routes = [
  { path: '/', name: 'home', component: HomeView },
  {
    path: '/mascotas/:id',
    name: 'mascota-detalle',
    component: MascotaDetalleView,
    props: true,
  },
  { path: '/admin', name: 'admin', component: AdminMascotasView },
  {
    path: '/admin/mascotas/nuevo',
    name: 'admin-mascota-nueva',
    component: AdminMascotaFormView,
  },
  {
    path: '/admin/mascotas/:id/editar',
    name: 'admin-mascota-editar',
    component: AdminMascotaFormView,
    props: true,
  },
]

export default createRouter({
  history: createWebHistory(),
  routes,
})
