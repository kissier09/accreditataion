<template>
  <div v-if="isVisible" class="modal-overlay" @click="closeModal">
    <div class="modal-content" @click.stop>
      <button @click="closeModal" class="close-btn">X</button>
      <h2>Task Force List</h2>
      
      <!-- Table for Task Force List -->
      <table class="task-force-table">
        <thead>
          <tr>
            <th>Area ID</th>
            <th>Name</th>
            <th>Role</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="task in taskForceList" :key="task.id">
            <td>{{ task.instruments.title }}</td>
            <td>{{ task.user_assigned ? task.user_assigned.first_name : 'N/A' }} 
                {{ task.user_assigned ? task.user_assigned.last_name : '' }}</td>
                <td>
                <template v-if="task.role === 'tfc'">
                  Chairperson
                </template>
                <template v-else>
                  {{ task.role }}
                </template>
              </td>
          </tr>
        </tbody>
      </table>

      <!-- Print Button -->
      <button @click="printContent" class="print-btn">Print Task Force List</button>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

// State for task force list
const taskForceList = ref([]);
const isVisible = ref(false);

// Fetch task forces on component mount
onMounted(() => {
  axios.get('/program/getTaskForces')
    .then((response) => {
      // Update the task force list with data from the backend
      taskForceList.value = response.data.task_forces;
      console.log(response.data.task_forces);
    })
    .catch((error) => {
      console.error("Error fetching task forces:", error);
    });
});

// Open and close modal functionality
const openModal = () => {
  isVisible.value = true;
};

const closeModal = () => {
  isVisible.value = false;
};

// Print function
const printContent = () => {
  const printWindow = window.open('', '', 'height=600,width=800');
  const content = document.querySelector('.modal-content').outerHTML; // Get the modal content

  // Open the print window and write the content
  printWindow.document.write('<html><head><title>Task Force List</title>');

  // Add custom styles to the print window
  printWindow.document.write(`
    <style>
      .close-btn, .print-btn {
        display: none;
      }
      /* Additional print styles for the content */
      body {
        font-family: Arial, sans-serif;
      }
      .task-force-table {
        width: 100%;
        border-collapse: collapse;
      }
      .task-force-table th, .task-force-table td {
        padding: 12px;
        border: 1px solid #ddd;
      }
      .task-force-table th {
        background-color: #f4f4f4;
      }
    </style>
  `);

  printWindow.document.write('</head><body>');
  printWindow.document.write(content); // Write the modal content to the window
  printWindow.document.write('</body></html>');
  printWindow.document.close();
  
  // Wait for the content to load before printing
  printWindow.onload = () => {
    printWindow.print();
  };
};

// Expose openModal method to the parent component
defineExpose({
  openModal
});
</script>
<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal-content {
  background: white;
  padding: 20px;
  border-radius: 8px;
  position: relative;
  width: 80%;
  max-width: 700px;
  overflow: auto;
}

.close-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  background: none;
  border: none;
  font-size: 16px;
  cursor: pointer;
}

h2 {
  margin-bottom: 15px;
}

.task-force-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 15px;
}

.task-force-table th, .task-force-table td {
  padding: 12px;
  border: 1px solid #ddd;
  text-align: left;
}

.task-force-table th {
  background-color: #f4f4f4;
}

.print-btn {
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 15px;
}

.print-btn:hover {
  background-color: #0056b3;
}

/* Hide all buttons when printing */
@media print {
  .close-btn, .print-btn {
    display: none;
  }
}
</style>
