<template>
    <div class="dark:bg-tertiaryDarkBg/40 bg-whiteBg w-full rounded-md p-2">
        <div class="flex items-center gap-0.5">
            <div class="w-6 h-6 overflow-hidden rounded-full">
                <Avatar :avatar="comment.user.avatar" />
            </div>
            <div class="ml-2 mr-1" v-if="comment.userId == $page.props.user.userId">You</div>
            <div class="ml-2 mr-1" v-else>{{comment.user.first_name+' '+comment.user.last_name}}</div>
            <span class="text-xs flex gap-1"> &#8226; <TimePass :time="comment.created_at" /></span>
        </div>

        <div class="inter-font mt-1.5 pl-[2.1rem] whitespace-pre-wrap break-words">
            {{comment.comment}}
        </div>
        <div class="inter-font mt-1.5 pl-[2.1rem] whitespace-pre-wrap break-words" style="color:red">
            {{comment.status}}
        </div>
        <div v-if="$page.props.user.d === 7" class="status-dropdown">
          <select v-model="selectedStatus" @change="setStatus(selectedStatus)" aria-label="Select Comment Status">
            <option value="Strength">Strength</option>
            <option value="Needs Improvement">Needs Improvement</option>
            <option value="Recommendation">Recommendation</option>
          </select>
        </div>
    </div>
</template>

<script setup>
import axios from 'axios';

const props = defineProps({
  comment: Object,
});

const emit = defineEmits(['updateStatus']);

const setStatus = async (newStatus) => {
  try {
    const response = await axios.post('/comment/update-status', {
      commentId: props.comment.id,
      newStatus,
    });

    if (response.status === 200) {
      emit('updateStatus', newStatus);
      window.location.reload();
    } else {
      console.error('Failed to update status');
    }
  } catch (error) {
    console.error('Error updating status:', error);
  }
};

// Method to trigger the print dialog
const printComment = () => {
  const printContent = document.getElementById('comment-to-print');
  const printWindow = window.open('', '', 'height=600,width=800');
  printWindow.document.write('<html><head><title>Print Comment</title></head><body>');
  printWindow.document.write(printContent.innerHTML);
  printWindow.document.write('</body></html>');
  printWindow.document.close();
  printWindow.print();
};
</script>

<style scoped>
.status-dropdown select {
  padding: 8px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #fff;
  cursor: pointer;
}

.status-dropdown select:focus {
  outline: none;
  border-color: #0066cc;
}

button {
  margin-top: 10px;
  padding: 8px 16px;
  background-color: #0f0;
  border: 1px solid black;
  cursor: pointer;
}

button:hover {
  background-color: #e0e0e0;
}

button:focus {
  outline: 2px solid #0066cc;
}
</style>