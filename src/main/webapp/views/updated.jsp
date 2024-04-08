<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
  }
  
  .sidebar {
    height: 100vh;
    width: 100px;
    background-color: #333;
    position: fixed;
    left: 0;
    top: 0;
    overflow-x: hidden;
    padding-top: 20px;
  }

  .sidebar a {
    padding: 2px;
    text-decoration: none;
    font-size: 30px;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center; 
    margin-bottom: 4px;
    margin-top:100px;
  }

  .sidebar a:hover {
    background-color: #555;
  }

  .main-content {
    margin-left: 90px;
    padding: 20px;
    position: relative; 
  }

 .top-bar {
    background-color: #033C73;
    padding: 25px;
    color: white;
    border-bottom-left-radius: 65px; 
    height: 90px; 
    position: absolute; 
    top: 0; 
    left: 0; 
    right: 0; 
    z-index: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .top-bar img {
    display: block; 
    width: 60px; 
    height: 60px;
    margin-top:-60px;
    margin-left:45%;
    margin-right:45%;
    border:none;
    background-color:#033C73; 
}

.form-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 90%; 
    height: 80px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    z-index: 1;
    padding: 20px;
  margin-top:155px;
  padding-top:40px;
}

table {
  width: 104%;
  border-collapse: collapse;
}

table th {
  background-color: #f2f2f2;
}

table td {
  padding: 8px;
  text-align: left;
}

table td:last-child {
  text-align: center;
}

tr {
  border-bottom: 1px solid #ddd;
}

button {
  padding: 8px 16px;
  border: 1px solid #0F52BA;
  border-radius: 15px;
  background-color: white;
  color:#0F52BA ;
  cursor: pointer;
}

button.strt {
  background-color: #0F52BA;
  color:white;
}


button:hover {
  background-color: #033C73;
}

</style>
</head>
<body>

<div class="sidebar">
  <a href="/dash"><i class="fa fa-tachometer"></i></a>
  <a href="/showdata"><i class="fa fa-bars"></i></a> 
  <a href="/add"><i class="fa fa-plus"></i></a> 
  <a href="/"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
  
</div>

<div class="main-content">
  <div class="top-bar">
    <h2>Project Listing</h2>
    <img src="/img/clogo.png">
  </div>
  <div class="form-content">
    <input type="text" placeholder="Search..."  id="searchInput" style="width: 40%; padding: 8px; margin-bottom: 16px;">
    <button onclick="filterTable()">Filter</button>
    <table>
      <thead>
        <tr>
          <th>Project Name</th>
          <th>Reason</th>
          <th>Type</th>
          <th>Division</th>
          <th>Category</th>
          <th>Priority</th>
          <th>Department</th>
          <th>Location</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="list" items="${e_data}">
          <tr>
            <td>${list.name}</td>
            <td>${list.reason}</td>
            <td>${list.type}</td>
            <td>${list.division}</td>
            <td>${list.category}</td>
            <td>${list.priority}</td>
            <td>${list.department}</td>
            <td>${list.location}</td>
            <td>${list.status}</td>
            <td>
<form action="/run/{id}" method="post">
    <input type="hidden" name="id" value="${list.id}">
    <button type="submit" name="action" value="start" class="strt">Start</button>
    <button type="submit" name="action" value="close">Close</button>
    <button type="submit" name="action" value="cancel">Cancel</button>
</form>
   
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  
<div class="pagination">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a class="active" href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>
</div>
<script>
function filterTable() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("searchInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("dataTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0]; // Assuming you want to filter the first column (Project Name)
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

 <table id="dataTable">
      <!-- Your table content -->
    </table>

</body>
</html>
