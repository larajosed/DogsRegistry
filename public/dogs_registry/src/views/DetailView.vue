<script setup>
import DogDetail from "@/components/DogDetail.vue";
</script>
<template>
  <div>
    <router-link :to="{ name: 'home' }">
      <button>Volver al listado</button>
    </router-link>
    <DogDetail></DogDetail>
  </div>
</template>