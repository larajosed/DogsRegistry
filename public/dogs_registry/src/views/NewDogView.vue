<script setup>
import NewDog from "@/components/NewDog.vue";
</script>


<template>
  <div>
    <router-link :to="{ name: 'home' }">
      <button>Volver al listado</button>
    </router-link>
    <NewDog></NewDog>
  </div>
</template>