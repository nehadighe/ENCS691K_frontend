<template>
  <div>
    <h1 class="pb-5 text-center dark-2-golden-font">Verifiaction Code</h1>
    <v-form ref="form" v-model="valid">
      <!-- verification code -->
      <v-text-field
        :color="themeColor"
        v-model="code"
        :rules="rules.required"
        name="verification-code"
        label="Verification Code"
        filled
        @keyup.enter="[valid ? verifyCode() : null]"
      ></v-text-field>
      <div class="d-flex align-left">
        <a
          class="mb-2 text-left extraTextStyle"
          @click="resentVerification()"
        >Resent the verification?</a>
        <p
          style="padding-left:10px"
          :class="counter >= 3 ? `verification-max` : `verification-resent`"
          class="mb-0"
        >{{ counter }}/3</p>
      </div>
      <v-row>
        <v-col cols="12" class="d-flex justify-center">
          <v-btn
            v-if="!requestLoading"
            :style="valid ? {transition: `0.3s ease`} : null"
            :color="valid ? themeColor : null"
            :class="[valid ? `white--text` : '']"
            @click="[valid ? verifyCode() : null]"
          >Verify</v-btn>
          <v-progress-circular v-if="requestLoading" :size="25" :color="themeColor" indeterminate></v-progress-circular>
        </v-col>
      </v-row>
    </v-form>
  </div>
</template>

<script>
export default {
  name: "Verification",
  data: () => ({
    valid: false,
    rules: {
      required: [v => !!v || "Required."]
    },
    code: "",
    counter: 0
  }),
  props: {
    themeColor: String,
    requestLoading: Boolean
  },
  methods: {
    verifyCode() {
      var event = {
        valid: this.valid,
        code: this.code
      };
      this.$emit("verifyCode", event);
    },
    resentVerification() {
      if (this.counter < 3) {
        this.counter++;
      }
      this.$emit("resentVerification");
    }
  }
};
</script>

<style>
.verification-max {
  color: #900028;
  font-weight: 700;
}

.verification-resent {
  color: #b08c62 !important;
}
</style>