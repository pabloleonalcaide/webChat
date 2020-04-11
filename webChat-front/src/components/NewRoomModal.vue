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
        <ErrorMessage v-if="invalid"
          :text="errorMessage"
        >
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
import ErrorMessage from './ErrorMessage'
import { createRoom } from '../services/api/room'
import { INVALD_ROOM_NAME_ERROR } from '../../static/constants'
import { uuid } from 'vue-uuid'
export default {
  name: 'NewRoomModal',
  components: {
    'ErrorMessage': ErrorMessage
  },
  data () {
    return {
      roomName: '',
      invalid: false,
      errorMessage: ''
    }
  },
  methods: {
    close () {
      this.invalid = false
      this.$emit('close')
    },
    save () {
      this.invalid = this.roomName.length < 4 || this.roomName.length > 20
      const roomId = uuid.v4()
      let data = {id: roomId, name: this.roomName}
      if (!this.invalid) {
        createRoom(data).then(resp => {
          if (resp.status === 201) {
            this.$store.dispatch('addRoom', {name: this.roomName})
            this.$emit('close')
          }
        }).catch(error => {
          this.errorMessage = error.response.data.message
          this.invalid = true
        })
      } else {
        this.errorMessage = INVALD_ROOM_NAME_ERROR
      }
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
      min-width: 350px;
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
      cursor: pointer;
      background-color: #21ade7;
      color: #fff;
      border: 1px solid #21ade7;
      border-radius: 4px;
      padding: 5px;
      margin: 10px;
      font-weight: bold;
      &:hover{
        background-color:#1a8dbe;
      }
    }
  }
  .modal-body {
    position: relative;
    padding: 20px 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    input{
      background: none;
      color: gray;
      font-size: 18px;
      padding: 10px 10px 10px 5px;
      display: block;
      width: 80%;
      border: none;
      border-radius: 0;
      border-bottom: 1px solid gray;
    };
    p {
      min-height: 22px
    }
  }
</style>
