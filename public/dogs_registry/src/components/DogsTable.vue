<script>
import { reactive } from "vue";
import { DogsService } from "@/service/DogsService.js";

export default {
  setup() {
    const data = reactive({
      dogs: [],
    });
    DogsService.getAll().then((response) => {
      data.dogs = response.data;
    });
    return {
      data,
    };
  },
};
</script>



<template>
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
      <tr v-bind:key="dog.id" v-for="dog in data.dogs">
        <td><img src="" alt="" /></td>
        <td>{{ dog.race }}</td>
        <td>{{ dog.size }}</td>
        <td>{{ dog.color }}</td>
      </tr>
    </tbody>
  </table>
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
</style>