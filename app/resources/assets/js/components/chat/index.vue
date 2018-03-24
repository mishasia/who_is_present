<template>
    <div class="chat">
        <StatusBar />
        <Messages :teacher="teacher" :messages="messages" />
        <InputForm @on-send="onMsgSend" />
    </div>
</template>

<script>
    import axios from 'axios'
    import Messages from './Messages.vue'
    import StatusBar from './StatusBar.vue'
    import InputForm from './InputForm.vue'

    export default {
        components: { Messages, StatusBar, InputForm },
        data: () => ({
           messages: [],
           teacher: {},
        }),
        mounted() {
            this.fetchAllData()
        },
        methods: {
            onMsgSend(message) {
                this.sendMsg(message).then(() => {
                    this.fetchAllMessages(this.teacher.id).then(messages => {
                        this.messages = messages
                    })
                })
            },
            sendMsg(message) {
                const { teacher } = this
                return axios.post('/chat/message/save', {
                    message,
                    sender_id: teacher.id,
                    department_id: teacher.department_id,
                })
            },
            fetchAllMessages(senderId) {
                return axios.get('/chat/message/all', {
                    params: {
                        sender_id: senderId,
                    },
                }).then(response => response.data)
            },
            fetchAllData() {
                axios.get('/teacher').then((response) => {
                    const teacher = response.data
                    this.fetchAllMessages(teacher.id).then(messages => {
                        this.messages = messages
                        this.teacher = teacher
                    })
                })
            }
        }
    }
</script>
