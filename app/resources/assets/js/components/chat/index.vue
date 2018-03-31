<template>
    <div class="chat">
        <StatusBar :membersAmount="membersAmount" />
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
            membersAmount: 0,
        }),
        mounted() {
            this.fetchAllData().then((teacher) => {
                setInterval(this.updateMessagesCallback.bind(this, teacher.id), 1000)
                this.fetchMembersAmount(teacher)
            })
        },
        methods: {
            fetchMembersAmount(teacher) {
                axios.get(`/department-members-count/${teacher.department_id}`)
                    .then(response => this.membersAmount = response.data)
            },
            updateMessages(newMessages) {
                this.messages = newMessages
            },
            updateMessagesCallback(teacherId) {
                this.fetchAllMessages(teacherId)
                    .then(this.updateMessages)
            },
            onMsgSend(message) {
                this.sendMsg(message).then(() => {
                    this.fetchAllMessages(this.teacher.id)
                        .then(this.updateMessages)
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
                return axios.get('/teacher')
                    .then((response) => {
                        const teacher = response.data
                        this.fetchAllMessages(teacher.id)
                            .then(messages => {
                                this.messages = messages
                                this.teacher = teacher
                            })
                        return Promise.resolve(teacher)
                    })
            }
        }
    }
</script>
