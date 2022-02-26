<script>
import { reactive } from "vue";
import { DogsService } from "@/service/DogsService.js";
import { useRoute, useRouter } from "vue-router";
import { onMounted } from "vue";

export default {
  setup() {
    const route = useRoute();
    const router = useRouter();
    const data = reactive({
      dog: {},
    });

    DogsService.getById(route.params.id).then((response) => {
      data.dog = response.data;
    });
    function goBack() {
      router.back();
    }
    return {
      data,
      goBack,
    };
  },
};
</script>

<template>
  <div>
    <div>
      <button v-on:click="goBack">Volver</button>
      <h1>Raza: {{ data.dog.race }}</h1>
      <p>Tamaño: {{ data.dog.size }}</p>
      <p>Color: {{ data.dog.color }}</p>
    </div>
    <div>
      <img :src="data.dog.photo" alt="" />
    </div>
  </div>
</template>
