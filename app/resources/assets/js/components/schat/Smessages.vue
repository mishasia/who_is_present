<template>
    <div class="messages-container">
        <div v-for="message in messages">
            <Message
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
    import Smessage from './Smessage.vue'

    export default {
        components: { Smessage },
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
