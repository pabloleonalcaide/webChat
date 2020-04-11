<template>
  <p>
    <span class="error-text">{{ text }}</span>
  </p>
</template>

<script>
export default {
  name: 'errorMessage',
  props: {
    text: String
  }
}
</script>

<style>
  .error-text{
    color: #b10202;
    font-size: 0.8em;
  }
</style>
