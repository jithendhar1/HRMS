<!DOCTYPE html>
<html>
<head>
    <title>Delete Holiday Form</title>
</head>
<body>
<!-- Script to automatically trigger deletion when the page loads -->
<script>
    window.addEventListener('load', function() {
        // Extract the 'id' parameter from the URL
        var urlParams = new URLSearchParams(window.location.search);
        var holidaiId = urlParams.get('id');
console.log("you have entered deleteHoliday");
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteHolidaySrv', true);
        console.log("deleteHolidaysrv called");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('id=' + holidayId);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                console.log(response); // You can log the response to the console
            }
        };
    });
</script>

<%   response.sendRedirect("holiday.jsp"); %>
</body>
</html>