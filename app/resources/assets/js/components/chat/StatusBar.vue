<template>
    <div class="status-bar">
        <p class="members-status">
            {{ membersAmount }}
            {{ countText }}
        </p>
    </div>
</template>

<script>
    export default {
        props: ['membersAmount'],
        computed: {
            countText() {
                const val = this.membersAmount < 20
                    ? this.membersAmount
                    : this.membersAmount % 10
                switch(val) {
                    case 1:
                        return 'учасник'
                    case 2:
                    case 3:
                    case 4:
                        return 'учасники'
                    default:
                        return 'учасників'
                }
            }
        }
    }
</script>
