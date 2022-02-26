<script setup>
import DogDetail from "@/components/DogDetail.vue";
</script>
<template>
  <div>
    <div>
      <router-link :to="{ name: 'home' }">
        <button>Volver al listado</button>
      </router-link>
    </div>
    <DogDetail></DogDetail>
  </div>
</template>