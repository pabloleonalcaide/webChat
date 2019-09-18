<template>
  <li class="listElement">
    <button
      :value="id"
      :name="name"
      @click="selectRoom"
      >
      <message-text /> {{name}}
    </button>
  </li>
</template>
<script>
import MessageText from 'vue-material-design-icons/MessageText'
export default {
  name: 'RoomElement',
  props: ['name', 'id'],
  components: {
    'message-text': MessageText
  },
  methods: {
    selectRoom (event) {
      this.$emit('selectRoom', event.target.name)
    }
  }
}
</script>
<style lang="scss" scoped>
  .listElement{
    display: block;
    margin-top: 8px;
    box-shadow: 1px 1px 2px 1px rgb(163, 163, 163);
    button{
      width: 100%;
      text-align: left;
      background: transparent;
      padding: 8px;
      border-top: 1px solid transparent;
      border-bottom: 1px solid transparent;
      border-left: 3px solid transparent;
      border-right: 3px solid transparent;
      cursor: pointer;
      &:hover{
        border-right-color: #21ade7;
        border-left-color: #21ade7;
        box-shadow: inset 0 3px 40px 3px rgba(255,255,255,0.6), 0px 4px 5px 0px rgba(81, 173, 196, 0.4);
      }
    }
  }
</style>
