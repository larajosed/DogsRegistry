<script>
import { reactive } from "vue";
import { DogsService } from "@/service/DogsService.js";
import { useRouter } from "vue-router";

export default {
  setup(props, ctx) {
    const router = useRouter();
    const newDog = {};

    function submitDog(dog) {
      console.log(dog);
      DogsService.add(dog).then(
        (response) => {
          router.push({ name: "home" });
        },
        (error) => {
          console.log(error);
        }
      );
    }
    function updatePhoto(event) {
      const file = event.target.files[0];
      const reader = new FileReader();
      reader.onload = function (event) {
        newDog.photo = event.target.result;
      };
      reader.readAsDataURL(file);
    }
    return {
      newDog,
      submitDog,
      updatePhoto,
    };
  },
};
</script>



<template>
  <form @submit.prevent="submitDog(newDog)">
    <h1>Nuevo Perro</h1>
    <div>
      <label for="race">Raza</label>
      <input v-model="newDog.race" type="text" id="race" required />
    </div>
    <div>
      <label for="size">Tamaño</label>
      <div>
        <input
          v-model="newDog.size"
          type="radio"
          name="size"
          id="small"
          value="Pequeño"
        />
        <label for="small">Pequeño</label>
      </div>
      <div>
        <input
          v-model="newDog.size"
          type="radio"
          name="size"
          id="medium"
          value="Mediano"
        />
        <label for="medium">Mediano</label>
      </div>
      <div>
        <input
          v-model="newDog.size"
          type="radio"
          name="size"
          id="big"
          value="Grande"
        />
        <label for="big">Grande</label>
      </div>
    </div>
    <div>
      <label for="color">Color</label>
      <input v-model="newDog.color" type="text" id="color" required />
    </div>
    <div>
      <label for="photo">Foto</label>
      <input
        type="file"
        v-on:change="updatePhoto"
        ref="fileInput"
        accept="image/*"
      />
    </div>
    <button type="submit">Enviar</button>
  </form>
</template>