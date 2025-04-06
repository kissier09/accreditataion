<template>
    <button
        type="button"
        class="action-btn disabled:action-btn-disabled actionBtn hover:dark:shadow-[inset_0_1px_0_0_hsl(0deg_0%_100%_/_5%)]"
        @click="handleDelete"
        :disabled="disabled"
    >
        <DeleteIcon />
    </button>
</template>

<script setup>
import DeleteIcon from '../Icons/deleteIcon.vue'
import { defineProps, defineEmits } from 'vue'

// Define props for the parent component to pass the required state
const props = defineProps({
    selected: {
        type: Number, // Assuming the selected program's ID is passed
        required: true
    },
    disabled: {
        type: Boolean,
        default: false
    }
})

// Define emits to communicate with the parent component
const emits = defineEmits(['deleteProgram'])

const handleDelete = () => {
    if (props.selected) {
        emits('deleteProgram', props.selected) // Emit the delete event with the selected program's ID
    }
}
</script>
