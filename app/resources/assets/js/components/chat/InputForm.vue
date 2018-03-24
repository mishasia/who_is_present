<template>
    <div class="msg-input">
        <input class="msg-input" v-model="value" type="text" placeholder="Повідомлення">
        <button
            @click="onSendClick"
            :class="[ value ? '' : 'disabled' ]"
            class="send-message-button">Send</button>
    </div>
</template>

<script>
    export default {
        props: ['teacher'],
        data: () => ({
            value: '',
        }),
        methods: {
            onSendClick() {
                if (this.value) {
                    this.$emit('on-send', this.value)
                    this.value = ''
                }
            }
        }
    }
</script>
