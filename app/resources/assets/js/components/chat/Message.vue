<template>
    <div class="message" :class="[ your ? 'your' : '' ]">
        <div class="message-img">
            <p class="author-initials">{{ initials }}</p>
        </div>
        <div class="message-content">
            <p class="message-content-author">{{ author }}</p>
            <div class="message-content-text">{{ message }}</div>
            <div class="message-content-date">{{ date }}</div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['author', 'message', 'date', 'your'],
        computed: {
            initials() {
                console.log(this.author)
                return this.author
                    .split(' ')
                    .map(x => x[0])
                    .join('')
            }
        }
    }
</script>
