<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View ToDo Item List</title>
	<!-- Include animate.css from CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
	
    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
            

    <style>
    
		body {
	        background-image: url('../image/bg2.jpg');
    	}
    	
		h1 {
		    /* Add your custom styles for the header */
		    padding: 20px;
		    text-align: center;
		    color: green; /* Dark text color */
 		 }

  	.icon {
	    /* Add styles for the icon container */
	    display: inline-block;
	    margin-right: 10px;
	    font-size: 2em;
	    color: #007bff; /* Blue color for the icon */
  	  }
		
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
        
        table, th, td {
		  border: 3px solid purple;
		  border-radius: 10px;
		}
		
		
        
    </style>

</head>
<body>

    <div class="container">
		
      
		<h1 class="p-3 animate__animated animate__bounceIn"><span class="icon"><i class="fas fa-check-circle"></i></span>
  				Enkinlab's ToDo Item List
		</h1>
		
        <form:form>

            <table class="table">
            	<tr>
            		<th>Id</th>
            		<th>Title</th>
            		<th>Date</th>
            		<th>Status</th>
            		<th>Mark Completed</th>
            		<th>Edit</th>
            		<th>Delete</th>
            	</tr>

            	<c:forEach var="todo" items="${list}">
                    <tr>
                		<td>${todo.id}</td>
                		<td>${todo.title}</td>
                		<td>${todo.date}</td>
                		<td>${todo.status}</td>
                		<td><button type="button" class="btn btn-success">
                		    <a href="/updateToDoStatus/${todo.id}">Mark Complete</a>
                		</button></td>
                		<td><button type="button" class="btn btn-primary">
                		    <a href="/editToDoItem/${todo.id}">Edit</a>
                		</button></td>
                		<td><button type="button" class="btn btn-danger">
                			<a href="/deleteToDoItem/${todo.id}">Delete</a>
                		</button></td>
                	</tr>

            	</c:forEach>

            </table>

        </form:form>

        <div class="text-center mt-3">
	  <button type="button" class="btn btn-primary" style="min-width: 200px; border-radius: 20px; min-height=35px">
	    <a href="/addToDoItem" style="color: inherit; text-decoration: none;">Add New ToDo Item</a>
	  </button>
	</div>


    </div>

    <script th:inline="javascript">
                window.onload = function() {

                    var msg = "${message}";
                    
                    if (msg == "Save Success") {
        				Command: toastr["success"]("Item added successfully!!")
        			} else if (msg == "Delete Success") {
        				Command: toastr["success"]("Item deleted successfully!!")
        			} else if (msg == "Delete Failure") {
        			    Command: toastr["error"]("Some error occurred, couldn't delete item")
        			} else if (msg == "Edit Success") {
        				Command: toastr["success"]("Item updated successfully!!")
        			}

        			toastr.options = {
                          "closeButton": true,
                          "debug": false,
                          "newestOnTop": false,
                          "progressBar": true,
                          "positionClass": "toast-top-right",
                          "preventDuplicates": false,
                          "showDuration": "300",
                          "hideDuration": "1000",
                          "timeOut": "5000",
                          "extendedTimeOut": "1000",
                          "showEasing": "swing",
                          "hideEasing": "linear",
                          "showMethod": "fadeIn",
                          "hideMethod": "fadeOut"
                        }
        	    }
            </script>

</body>

</html>



