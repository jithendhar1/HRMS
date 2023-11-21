<%--  

  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Board</title>
    <!-- Include necessary styles and scripts, including Chart.js -->
    <link rel="stylesheet" href="path/to/chartjs.min.css">
    <script src="path/to/chartjs.min.js"></script>
</head>

<body>

    <!-- Header Section -->
    <header>
        <h1>Task Board</h1>
    </header>

    <!-- Chart Section -->
    <section id="pieChartSection">
        <canvas id="taskPieChart" width="400" height="400"></canvas>
    </section>

    <script>
        // Retrieve URL parameters
        var urlParams = new URLSearchParams(window.location.search);
        var pendingTasks = parseInt(urlParams.get('pending')) || 0;
        var assignedTasks = parseInt(urlParams.get('assigned')) || 0;

        // Create data for the pie chart
        var chartData = {
            labels: ['Pending', 'Assigned'],
            datasets: [{
                data: [pendingTasks, assignedTasks],
                backgroundColor: ['red', 'green'],
            }],
        };

        // Get the canvas element
        var ctx = document.getElementById('taskPieChart').getContext('2d');

        // Create the pie chart
        var taskPieChart = new Chart(ctx, {
            type: 'pie',
            data: chartData,
        });
    </script>

</body>

</html>
   --%>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Status</title>
    <!-- Include necessary styles and scripts, including Chart.js -->
    <link rel="stylesheet" href="path/to/chartjs.min.css">
    <script src="path/to/chartjs.min.js"></script>
</head>

<body>

    <!-- Header Section -->
    <header>
        <h1>Task Status</h1>
    </header>

    <!-- Chart Section -->
    <section id="pieChartSection">
        <canvas id="taskPieChart" width="400" height="400"></canvas>
    </section>

    <script>
        // Retrieve URL parameters
        var urlParams = new URLSearchParams(window.location.search);
        var pendingTasks = parseInt(urlParams.get('pending')) || 0;
        var assignedTasks = parseInt(urlParams.get('assigned')) || 0;

        // Create data for the pie chart
        var chartData = {
            labels: ['Pending', 'Assigned'],
            datasets: [{
                data: [pendingTasks, assignedTasks],
                backgroundColor: ['#ffcc00', '#4CAF50'],
            }],
        };

        // Get the canvas element
        var ctx = document.getElementById('taskPieChart').getContext('2d');

        // Create the pie chart
        var taskPieChart = new Chart(ctx, {
            type: 'pie',
            data: chartData,
        });
    </script>

</body>

</html>
   