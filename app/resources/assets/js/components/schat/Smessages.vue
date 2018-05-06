<template>
    <div class="messages-container">
        <div v-for="message in messages">
            <message
              :your="checkIsYour(message.sender.id)"
              :authorName="getFullName(message.sender.first_name, message.sender.last_name)"
              :authorData="message.sender"
              :message="message.message"
              :date="message.created_at"
            />
        </div>
    </div>
</template>

<script>
  import message from './Smessage.vue'

  export default {
    components: { message },
    props: ['messages', 'student'],
    methods: {
      getFullName(fn, ln) {
        return `${fn} ${ln}`
      },
      checkIsYour(senderId) {
        return this.student.id === senderId
      }
    }
  }
</script>
