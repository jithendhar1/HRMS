<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.service.impl.taskDAO" %>
<!-- Other imports and page setup -->
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta tags and CSS links -->
</head>
<body>
    <!-- Main content and dashboard elements -->

    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Link to trigger pie chart -->
    <a href="#" id="taskLink">Tasks</a>

    <!-- Canvas to render pie chart -->
    <canvas id="taskChart" width="400" height="400"></canvas>

    <!-- JavaScript to generate pie chart on click -->
    <script>
        document.getElementById('taskLink').addEventListener('click', function(event) {
            // Dummy data for the pie chart
            var taskCompletionData = {
                labels: ['Completed', 'Pending'],
                datasets: [{
                    data: [70, 30], // Replace with your actual data
                    backgroundColor: [
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(255, 99, 132, 0.6)'
                    ],
                    borderColor: [
                        'rgba(75, 192, 192, 1)',
                        'rgba(255, 99, 132, 1)'
                    ],
                    borderWidth: 1
                }]
            };

            // Chart options
            var pieChartOptions = {
                responsive: true,
                maintainAspectRatio: false
            };

            // Get the canvas element
            var ctx = document.getElementById('taskChart').getContext('2d');

            // Create the pie chart
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: taskCompletionData,
                options: pieChartOptions
            });
        });
    </script>

    <!-- Other JavaScript links -->
</body>
</html>
