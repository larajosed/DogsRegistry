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

    return {
      data,
    };
  },
};
</script>

<template>
  <div class="dog-detail-contariner">
    <div class="dog-detail">
      <h1>Raza: {{ data.dog.race }}</h1>
      <p>Tamaño: {{ data.dog.size }}</p>
      <p>Color: {{ data.dog.color }}</p>
    </div>
    <div class="dog-photo">
      <img class="dog-img" :src="data.dog.photo" alt="" />
    </div>
  </div>
</template>

<style>
.dog-detail-contariner {
  display: flex;
  margin-top: 10px;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap-reverse;
}

.dog-detail {
  border: 1px solid;
  background-color: antiquewhite;
  display: inline-block;
  width: 300px;
  margin-right: 10px;
  min-height: 200px;
  padding: 5px;
}

.dog-detail h1 {
  text-align: center;
}

.dog-detail p {
  text-align: center;
}

.dog-photo {
  display: inline-block;
}

.dog-img {
  max-height: 200px;
  max-width: 200px;
  border: 2px solid;
}
</style>