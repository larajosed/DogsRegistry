<script>
import { reactive } from "vue";
import { DogsService } from "@/service/DogsService.js";
import { useRouter } from "vue-router";

export default {
  setup(props, ctx) {
    const router = useRouter();
    const data = reactive({
      dogs: [],
    });
    DogsService.getAll().then((response) => {
      data.dogs = response.data;
    });

    function goToDetail(id) {
      router.push({ name: "detail", params: { id: id } });
    }

    return {
      data,
      goToDetail,
    };
  },
};
</script>



<template>
  <div>
    <table>
      <thead class="head">
        <tr>
          <th>Imagen</th>
          <th>Raza</th>
          <th>Tamaño</th>
          <th>Color</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-bind:key="dog.id"
          v-for="dog in data.dogs"
          v-on:click="goToDetail(dog.id)"
        >
          <td><img class="photo" :src="dog.photo" alt="" /></td>
          <td>{{ dog.race }}</td>
          <td>{{ dog.size }}</td>
          <td>{{ dog.color }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>


<style>
table {
  width: 100%;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  border-collapse: collapse;
}

.head {
  background-color: antiquewhite;
  height: 80px;
  margin: 50px;
  padding: 10px;
}

td,
th {
  text-align: center;
  border: 1px solid;
}
.photo {
  max-height: 110px;
  max-width: 110px;
}
</style>