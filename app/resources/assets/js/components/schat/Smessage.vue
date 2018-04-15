<template>
    <div class="message" :class="[ your ? 'your' : '' ]">
        <div class="message-img" >
            <img v-if="authorData.avatar" class="message-img" :src="authorData.avatar">
            <p v-else class="author-initials">{{ initials }}</p>
        </div>
        <div class="message-content">
            <p class="message-content-author">{{ authorOrYouName }}</p>
            <div class="message-content-text">{{ message }}</div>
            <div class="message-content-date">{{ date }}</div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['authorData', 'authorName', 'message', 'date', 'your'],
        computed: {
            initials() {
                return this.authorName
                    .split(' ')
                    .map(x => x[0])
                    .join('')
            },
            authorOrYouName() {
                return this.your
                    ? 'Ви'
                    : this.authorName
            }
        }
    }
</script>
