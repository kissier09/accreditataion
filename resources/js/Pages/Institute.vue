<template>
<Layout :user="$page.props.user">
    <template #subNav>
        <div class="w-full py-1.5 flex gap-3 sticky top-14 subnavBg dark:border-primaryDarkBorder border-t border-slate-200 px-2.5">
            <CreateButton @click="openCreate = true" v-if="[1,6].includes($page.props.user.auth)" />
            <EditButton :disabled="!selected" @click="edit" />
            <DeleteButton 
                v-if="selected" 
                @click="deleteProgram" 
                :disabled="$page.props.user.auth == 4" 
            />
            <InfoButton :disabled="!selected" @click="isView = true" v-if="false" />
        </div>
    </template>

    <div class="grid grid-cols-[repeat(auto-fill,minmax(17rem,1fr))] gap-3 mt-4">
        <InstituteCard 
            :selected="selected" 
            :institute="institute"
            @click="selected = institute.id"
            v-for="institute in $page.props.institutes" 
        />

    </div>

    <Modal 
        v-if="openCreate" 
        @handle-close="openCreate = false, selected = null, isEdit = false" 
        :isEdit="isEdit" 
        :selected="selected" 
        :institutes="$page.props.institutes"
    />

    <InfoModal
        v-if="isView"
        @handle-close="isView = false"
    />
</Layout>
</template>

<script setup>  
import Layout from '../Components/Layout.vue'
import InfoButton from '../Components/Buttons/Info.vue'
import EditButton from '../Components/Buttons/Edit.vue'
import Modal from '../Components/Institute/CreateModal.vue'
import CreateButton from '../Components/Buttons/Create.vue'
import InstituteCard from '../Components/Institute/Card.vue'
import DeleteButton from '../Components/Buttons/Delete.vue'
import InfoModal from '../Components/Institute/InstituteDetails.vue'
import { onMounted, onUnmounted, ref } from 'vue'

const isEdit = ref(false)
const isView = ref(false)
const selected = ref(null)
const openCreate = ref(false)

const edit = () => {
    isEdit.value = true
    openCreate.value = true
}

const deleteProgram = () => {
    if (selected.value) {
        // Assuming you have an API endpoint for deleting a program
        Inertia.delete(`/programs/${selected.value}`, {
            onSuccess: () => {
                // Optionally update UI or state after deletion
                const index = $page.props.programs.findIndex(p => p.id === selected.value)
                if (index !== -1) {
                    $page.props.programs.splice(index, 1)
                }
                selected.value = null
                update()
            },
            onError: (error) => {
                console.error('Failed to delete program:', error)
            }
        })
    }
}

const windowClick = (e) => {
    if(!e.target.closest(`#institute${selected.value}`) && !e.target.closest('.actionBtn') && !e.target.closest('.modal'))
    {
        //clear selected
        selected.value = null
    }
}

onMounted(()=>{
    window.addEventListener('click', windowClick)
})

onUnmounted(()=>{
    window.removeEventListener('click', windowClick)
})

</script>