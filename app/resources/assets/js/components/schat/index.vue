<template>
    <div class="schat">
        <SstatusBar :membersAmount="membersAmount" />
        <Smessages :student="student" :messages="messages" />
        <SinputForm @on-send="onMsgSend" />
    </div>
</template>

<script>
    import axios from 'axios'
    import Smessages from './Smessages.vue'
    import SstatusBar from './SstatusBar.vue'
    import SinputForm from './SinputForm.vue'

    export default {
        components: { Smessages, SstatusBar, SinputForm },
        data: () => ({
            messages: [],
            student: {},
            membersAmount: 0,
        }),
        mounted() {
            this.fetchAllData().then((student) => {
                setInterval(this.updateMessagesCallback.bind(this, student.id), 1000)
                this.fetchMembersAmount(student)
            })
        },
        methods: {
            fetchMembersAmount(student) {
                axios.get(`/group-members-count/${student.group_id}`)
                    .then(response => this.membersAmount = response.data)
            },
            updateMessages(newMessages) {
                this.messages = newMessages
            },
            updateMessagesCallback(studentId) {
                this.fetchAllMessages(studentId)
                    .then(this.updateMessages)
            },
            onMsgSend(message) {
                this.sendMsg(message).then(() => {
                    this.fetchAllMessages(this.student.id)
                        .then(this.updateMessages)
                })
            },
            sendMsg(message) {
                const { student } = this
                return axios.post('/schat/message/save', {
                    message,
                    sender_id: student.id,
                    group_id: student.group_id,
                })
            },
            fetchAllMessages(senderId) {
                return axios.get('/schat/message/all', {
                    params: {
                        sender_id: senderId,
                    },
                }).then(response => response.data)
            },
            fetchAllData() {
                return axios.get('/student')
                    .then((response) => {
                        const student = response.data
                        this.fetchAllMessages(student.id)
                            .then(messages => {
                                this.messages = messages
                                this.student = student
                            })
                        return Promise.resolve(student)
                    })
            }
        }
    }
</script>
