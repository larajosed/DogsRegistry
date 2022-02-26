<script>
import { reactive } from "vue";
import { DogsService } from "@/service/DogsService.js";
import { useRouter } from "vue-router";

export default {
  setup(props, ctx) {
    const router = useRouter();
    const newDog = reactive({ size: "Pequeño" });

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
  <div class="new-dog-container">
    <form class="form-new-dog" @submit.prevent="submitDog(newDog)">
      <h1>Nuevo Perro</h1>
      <div class="input-block">
        <label for="race">Raza</label>
        <input v-model="newDog.race" type="text" id="race" required />
      </div>
      <div>
        <label for="size">Tamaño</label>
        <div class="input-block">
          <input
            v-model="newDog.size"
            type="radio"
            name="size"
            id="small"
            value="Pequeño"
          />
          <label for="small">Pequeño</label>
        </div>
        <div class="input-block">
          <input
            v-model="newDog.size"
            type="radio"
            name="size"
            id="medium"
            value="Mediano"
          />
          <label for="medium">Mediano</label>
        </div>
        <div class="input-block">
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
      <div class="input-block">
        <label for="color">Color</label>
        <input v-model="newDog.color" type="text" id="color" required />
      </div>
      <div class="input-block">
        <label for="photo">Foto</label>
        <input
          type="file"
          v-on:change="updatePhoto"
          ref="fileInput"
          accept="image/*"
          required
        />
        <div class="photo-preview-container" v-if="newDog.photo">
          <img class="photo-preview" :src="newDog.photo" alt="" />
        </div>
      </div>
      <div class="input-block">
        <button type="submit">Enviar</button>
      </div>
    </form>
  </div>
</template>

<style>
.new-dog-container {
  display: flex;
  justify-content: center;
}
.form-new-dog {
  padding: 15px;
}

.input-block {
  margin-top: 10px;
}

.input-block label {
  width: 60px;
  display: inline-block;
}

.form-new-dog input[type="radio"] {
  margin-left: 20px;
}

.photo-preview {
  max-height: 150px;
  max-width: 150px;
}

.photo-preview-container {
  margin-top: 10px;
  text-align: right;
}
</style>