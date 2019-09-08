<template>
  <transition name="modal-fade">
    <div class="modal-backdrop">
      <div class="modal"
        role="dialog"
        aria-labelledby="modalTitle"
        aria-describedby="modalDescription"
      >
        <header
          class="modal-header"
          id="modalTitle"
        >
          <span>
            Crear Nueva Sala
          </span>
        </header>
        <section class="modal-body">
          <input type="text" v-model.trim="roomName" placeholder="Sala...">
        </section>
        <footer class="modal-footer">
          <slot name="footer">
            <button
              type="button"
              class="btn-close"
              @click="close"
              aria-label="Close modal"
            >
              Cancelar
            </button>
            <button
              type="button"
              class="btn-save"
              @click="save()"
              aria-label="Close modal"
            >
              Crear Sala
            </button>
          </slot>
        </footer>
      </div>
    </div>
  </transition>
</template>
<script>
export default {
  name: 'NewRoomModal',
  data () {
    return {
      roomName: ''
    }
  },
  methods: {
    close () {
      this.$emit('close')
    },
    save () {
      // POST Room to API
      this.$emit('close')
    }
  }
}
</script>
<style lang="scss" scoped>
  .modal-backdrop {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.3);
    display: flex;
    justify-content: center;
    align-items: center;
    .modal {
      background: #FFFFFF;
      box-shadow: 2px 2px 20px 1px;
      overflow-x: auto;
      display: flex;
      flex-direction: column;
      min-width: 300px;
    }
  }
  .modal-header,
  .modal-footer {
    padding: 15px;
    display: flex;
  }

  .modal-header {
    border-bottom: 1px solid #eeeeee;
    color: #21ade7;
    justify-content: center;
    font-weight: bold;
  }
  .modal-footer {
    border-top: 1px solid #eeeeee;
    justify-content: flex-end;
    .btn-close,
    .btn-save {
      background: #21ade7;
      color: #fff;
      border: 1px solid #21ade7;
      border-radius: 4px;
      padding: 5px;
      margin: 10px;
      font-weight: bold;
    }
  }

  .modal-body {
    position: relative;
    padding: 20px 10px;
    display: flex;
    justify-content: center;
    input{
      background: none;
      color: gray;
      font-size: 18px;
      padding: 10px 10px 10px 5px;
      display: block;
      justify-self: center;
      width: 80%;
      border: none;
      border-radius: 0;
      border-bottom: 1px solid gray;
    }
  }
</style>
