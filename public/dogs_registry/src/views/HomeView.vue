<script setup>
import DogsTable from "@/components/DogsTable.vue";
</script>

<template>
  <main>
    <router-link :to="{ name: 'new' }">
      <button>Añadir nuevo perro</button>
    </router-link>
    <DogsTable />
  </main>
</template>
