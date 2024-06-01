<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Prescription</title>
    <style>
        /* Base Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h2 {
            margin-top: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input, textarea {
            width: calc(100% - 10px);
            margin-bottom: 15px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Responsive Styles */
        @media screen and (max-width: 600px) {
            form {
                width: 90%;
            }
        }

        /* Validation Styles */
        .error-message {
            color: red;
            margin-top: 5px;
            text-align: left; /* Align error messages to the left */
        }
    </style>
</head>
<body>
    <%@include file="MainDocter.jsp"%>

    <div class="col py-3">
        <form action="PrescriptionController" method="post" ">
            <center><h2>Add Prescription</h2></center>

            <label for="prescription_details">Prescription Details:</label>
            <textarea id="prescription_details" name="prescription_details" rows="4" required></textarea>
            <div id="prescriptionDetailsError" class="error-message"></div>

            <label for="ptid">Patient ID:</label> <input type="text" id="ptid" name="ptid"><br>
            <div id="patientIdError" class="error-message"></div>

            <label for="did">Doctor ID:</label> <input type="text" id="did" name="did"><br>
            <div id="doctorIdError" class="error-message"></div>

            <input type="submit" value="Add Prescription">
        </form>
        
    </div>
                         
</body>
</html>
