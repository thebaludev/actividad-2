# Meet Your Pet - Directorio de mascotas en adopción

Proyecto de la actividad 2 Creando con patrón de arquitectura. Front-end en Vue 3
(Composition API) + Vite, organizado en capas.

## Despliegue

Para facilitar la visualización del proyecto, fue desplegado en el servicio gratuito de la plataforma Netlify. El enlace de acceso es el siguiente:

<a href="https://meetyourpet.netlify.app" target="_blank">Meet Your Pet</a>

## Ejecución

El stack usado en el proyecto es basado en NodeJS v24.19.0 LTS. Para el frontend elegí Vue 3 usando Composition API ya que he tenido experiencia tanto en empleos como en proyectos personales y lo considero muy práctico y robusto para cualquier proyecto. Sumado a Vue estoy usando para los estilos Tailwind CSS porque igualmente tengo una familiaridad de varios años usandolo en proyectos personales y formales, es muy rápido realizar diseños con esta librería, y por ultimo estoy usando Typescript para Vue ya que es la forma en como mejor manejo el framework, es robusto y permite mantener una estructura más estricta del código.

La instalación del proyecto consta de los siguientes comandos:

```bash
npm install --legacy-peer-deps
npm run dev
```

## Arquitectura

```
src/
├── pages/          # presentación (vistas)
├── components/     # presentación (componentes reutilizables)
├── composables/     # lógica de negocio
├── services/        # acceso a datos / repositorio
├── data/            # datos de muestra temporales, simula los "datos" por el momento
├── router/          # definición de rutas
└── types/           # modelos TypeScript del dominio
```

Las vistas se leen directamente de `src/data/mascotas.sample.ts`. Cuando se desarrolle la capa de acceso a datos (`services/mascotas.repository.ts`), esa
capa expondrá las mismas funciones (`getMascotas()`, `getMascotaById(id)`, etc.) pero contra la API real.

## Modelo de datos

Profesor el modelado de datos se encuentra en la carpeta `course/mer/MER-MeetYourPet.png` donde está definida el diagrama generado desde la plataforma dbdiagram que considero muy práctica pra este proceso ya que puedo definir el diagrama en su lenguajes .dbml y posteriormente permite exportar hacia PostgreSQL, MySQL o SQL Server.
