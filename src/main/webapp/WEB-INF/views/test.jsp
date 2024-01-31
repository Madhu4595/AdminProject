<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- DataTables CSS and JS files -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<script>
//     $(document).ready(function() {
    	

//         // ... Your code here ...

//         // Destroy DataTable before reinitializing
//         dataTable.destroy();

//         $('#example').DataTable();
//     });
</script>
<script>
//     $(document).ready(function() {
//         $('#example').DataTable({
//             ajax: {
//                 url: './getEmps',
//                 dataSrc: 'data'
//             },
//             columns: [
//                 { data: 'code' },
//                 { data: 'name' },
//                 { data: 'designation' },
//                 { data: 'basic_pay' },
//                 { data: 'place' },
//                 { data: 'email' }
//             ]
//         });
//     });
</script>
<script>
    $(document).ready(function() {
//     	var dataTable = $('#example').DataTable();
//     	dataTable.destroy();
    	
        $('#example').DataTable({
            ajax: '../getEmpss',
            columns: [
                { data: 'code' },
                { data: 'name' },
                { data: 'designation' },
                { data: 'basic_pay' },
                { data: 'place' },
                { data: 'email' }
            ]
        });
    });
</script>


</head>
<body>
<table id="example" class="display" style="width:100%">
    <thead>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Start date</th>
            <th>Salary</th>
        </tr>
    </thead>
    <tbody>
        <!-- Table rows go here -->
    </tbody>
</table>

</body>
</html>