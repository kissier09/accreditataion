<template>
    <Aside :top="top" @handleClose="$emit('handleClose')">
        <template #head>
            Comment
        </template>

        <div class="flex-col-reverse flex p-1.5 gap-1">
            <!-- Print All Button -->
            <button @click="printAllContent" class="print-btn">Print All Content</button>

            <CommentCard :comment="comment" v-for="comment in comments" :key="comment.id" />
        </div>

        <div class="flex justify-center py-3" v-if="!comments">
            <Loading />
        </div>

        <div class="dark:text-white/50 text-center" v-if="myMethod.ifArray(comments, '==', 0)">
            No comments
        </div>

        <template #input>
            <div class="w-full min-h-[3.1rem] max-h-[9rem] p-2 shrink-0 border-t dark:border-primaryDarkBorder border-slate-300 relative">
                <InputMessage @handleMesage="send" @submitButton="send" />
            </div>
        </template>
    </Aside>
    <input type="hidden" :value="getComments()">
</template>

<script setup>
import Aside from '../../Aside.vue'
import Avatar from '../../Avatar.vue'
import Loading from '../../Loading.vue'
import CommentCard from '../../CommentCard.vue'
import InputMessage from '../../ContentEditable.vue'
import { ref } from '@vue/reactivity'
import myMethod from '../../../Store/Methods'

const props = defineProps({
    instrument: Object,
    accredlvl: Number,
    top: String
})
const emits = defineEmits(['handleClose'])

const comments = ref(null)

// Send comment to the server
const send = val => {
    if(val){
        if(val.trim().length > 0){
            axios.post('/instrument/comment', {
                instrumentId: props.instrument.id,
                accredlvl: props.accredlvl,
                comment: val
            }).then(res => {
                comments.value.push(res.data.response);
            }).catch(error => {
                console.log(error)
            })
        }
    }
}

// Fetch comments
const getComments = () => {
    try {
        axios.post('/instrument/get/comments', {
            instrumentId: props.instrument.id,
            accredlvl: props.accredlvl
        }).then(res => {
            comments.value = res.data.comments
        }).catch(error => {
            console.log(error)
        })
    } catch (e) {
        console.error(e)
    }
}

// Print all content method with table format and area as the title
// Print all content method with list format and sorted by status
const printAllContent = () => {
    // Hide the print button and other buttons
    const printButton = document.querySelector('.print-btn');
    const allButtons = document.querySelectorAll('button');
    printButton.style.display = 'none';  // Hide the print button
    allButtons.forEach(button => button.style.display = 'none');  // Hide all buttons

    // Get the area value from the instrument object (assuming 'area' exists)
    const area = "Comments List";

    // Group comments by status
    const strengths = comments.value.filter(comment => comment.status === "Strength");
    const needsImprovement = comments.value.filter(comment => comment.status === "Needs Improvement");
    const recommendations = comments.value.filter(comment => comment.status === "Recommendation");

    // Construct list HTML
    let listHTML = '<div style="font-family: Arial, sans-serif;">';

    // Helper function to generate list for each category
    const generateList = (title, items) => {
        let html = `<h3 style="margin-top: 20px;">${title}</h3>`;
        if (items.length === 0) {
            html += '<p>No comments available.</p>';
        } else {
            html += '<ul style="list-style-type: none; padding-left: 20px;">';
            items.forEach(comment => {
                html += `<li style="margin-bottom: 5px;">* ${comment.comment}</li>`;
            });
            html += '</ul>';
        }
        return html;
    };

    // Generate sorted sections
    listHTML += generateList("STRENGTH", strengths);
    listHTML += generateList("AREA NEEDS IMPROVEMENT", needsImprovement);
    listHTML += generateList("RECOMMENDATION", recommendations);

    listHTML += '</div>';

    // Open print window
    const printWindow = window.open('', '', 'height=600,width=800');
    printWindow.document.write('<html><head><title>' + area + '</title>');
    printWindow.document.write('<style>body { font-family: Arial, sans-serif; }</style>');
    printWindow.document.write('</head><body>');
    
    // Add the area as a title in the print window body
    printWindow.document.write('<h2 style="text-align: center;">' + area + '</h2>');
    printWindow.document.write(listHTML);  // Inject the list content
    
    printWindow.document.write('</body></html>');
    
    printWindow.document.close();  // Necessary for document to load before printing
    printWindow.print();  // Trigger print dialog

    // Restore the buttons after printing
    printButton.style.display = 'block';  // Show the print button
    allButtons.forEach(button => button.style.display = 'inline-block');  // Restore all buttons
}

</script>

<style scoped>
.print-btn {
    margin-bottom: 20px;
    padding: 10px 15px;
    background-color: #3498db;
    color: white;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
}

.print-btn:hover {
    background-color: #2980b9;
}

.status-buttons button {
    margin: 0 1px;
    padding: 5px 10px;
    background-color: #0f0;
    border: 1px solid black;
    cursor: pointer;
    font-size: 10px;
}

.status-buttons button:hover {
    background-color: #e0e0e0;
}

/* CSS for hiding elements when printing */
@media print {
    button {
        display: none !important;
    }
}
</style>
