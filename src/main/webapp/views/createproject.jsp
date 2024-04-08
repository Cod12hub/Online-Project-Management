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
    top: 800%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 96%; 
    height: auto;
    background-color: #f2f2f2;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    z-index: 1;
    padding: 20px;
}

.form-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
        width: calc(75.75% - 10px);
    
}

.form-row select, .form-row input[type="date"] {
    width: calc(33.33% - 10px);
    padding: 10px;
    margin-bottom: 10px;
    border-radius:8px;
}

.form-row1
{
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.form-row1 input[type="text"] {
    width: calc(44.44% - 5px);
    padding: 20px;
    margin-bottom: 10px;
    border-radius:8px;
}


/* Add gap between columns */
.form-row select + select, .form-row input[type="date"] + input[type="date"] {
    margin-left: 25px;
}

/* Add gap between rows */
.form-row + .form-row {
    margin-top: 10px;
}

.save-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    border-radius:25px;
    padding:8px;
    padding-left:25px;
    padding-right:25px;
    margin-right:55px;
    background-color: #0F52BA;
    color:white;
    
}
.status {
    position: absolute;
    bottom: 10px;
    left: 690px;
}

.status-input {
    position: absolute;
    bottom: 10px;
    left: 750px;
    width: calc(25% - 120px);
    padding: 9px;
    border-radius: 8px;
}


 span {
    margin-bottom: 5px;
}
.st
{
margin-left:690px;
padding-right:6px;

}


.placeholder-text {
    color: #aaa;
    position: absolute;
    pointer-events: none;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    z-index: 1;
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
    <h2>Create Project</h2>
    <img src="/img/clogo.png">
  </div>
  <div class="form-content">
    <form action="/save" method="post">
    <div class="form-row1">
     <input type="text" placeholder="Enter Project Theme" name="name">
     </div>
      
      <button type="submit" class="save-btn">Save Project</button>
      <div class="form-row">
                <span>Reason</span>
      
      
       <br> <select name="reason">
                <option value="Business" selected disabled hidden>Business</option>
                <option value="Dealership">Dealership</option>
                <option value="Transport">Transport</option>
                <option value="Business">Business</option>
                
                
            </select>
                  <span>Type</span>
        
       <br> <select name="type">
                <option value="Internal" selected disabled hidden>Internal</option>
                <option value="External">External</option>
                <option value="Vendor">Vendor</option>
                 <option value="Internal">Internal</option>
                
            </select>
                  <span>Division</span>
         <select name="division">
                <option value="Compressor" selected disabled hidden>Compressor</option>
                <option value="Filters">Filters</option>
                <option value="Pumps">Pumps</option>
                <option value="Glass">Glass</option>
                <option value="Water Heater">Water Heater</option>
                <option value="Compressor">Compressor</option>
                
                                
           </select>
        
      </div>
      <div class="form-row">
                      <span>Category</span>
        <select name="category">
                <option value="Quality A" selected disabled hidden>Quality A</option>
                <option value="Quality B">Quality B</option>
                <option value="Quality C">Quality C</option>
                <option value="Quality D">Quality D</option>
                <option value="Quality A">Quality A</option>
                
                
            </select>
      
                        <span>Priority</span>
          <select name="priority">
                <option value="High" selected disabled hidden>High</option>
                <option value="Low">Low</option>
                <option value="Medium">Medium</option>
                <option value="High">High</option>
                
            </select>
        
                        <span>Department</span>
          <select name="department">
                <option value="" selected disabled hidden>Startegy</option>
                <option value="Finance">Finance</option>
                <option value="Quality">Quality</option>
                 <option value="Maintenance">Maintenance</option>
                 <option value="Stores">Stores</option>
                 <option value="Startegy">Startegy</option>
                 
                                
                
            </select>
        
      </div>
      <div class="form-row">
                      <span>Start Date</span>
      
        <input type="date" placeholder="Textbox 7" name="startDate">
                        <span>End Date</span>
        
        <input type="date" placeholder="Textbox 8" name="endDate">
                        <span>Location</span>
          <select name="location">
                <option value="" selected disabled hidden>Pune</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Nagpur">Nagpur</option>
                 <option value="Delhi">Delhi</option>
                 <option value="Akola">Akola</option>
                 <option value="Amravati">Amravati</option>
                 <option value="Pune">Pune</option>
                 
                                                
                                
                
            </select>
        
      </div>
      <div class="form-row">
     <!--  <label class="status-label" name="status">Status:</label>
      <input type="text" placeholder="Status" class="status-input" disabled>-->
       <span class="st">Status</span>
          <select name="status" class="std">
                <option value="Running" selected disabled hidden>Running</option>
                <option value="Running">Running</option>
                <option value="Closed">Closed</option>
                <option value="Cancelled">Cancelled</option>
                </select>
                </div>
                
     
    </form>
  </div>
</div>

</body>
</html>
