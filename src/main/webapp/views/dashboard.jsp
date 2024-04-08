<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.highcharts.com/highcharts.js"></script>

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

 .sidebar a:hover, .sidebar a.active {
    background-color: blue;
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
  }
  .top-bar img {
    display: block; 
    width: 60px; 
    height: 60px;
    margin-top:-60px;
    margin-left:45%;
    border:none;
     background-color:#033C73; 
}
  .counter-container {
    display: flex;
    justify-content: space-between;
    margin-top: 80px;
    height: calc(50% - 10px); 
    position: relative; 
    z-index: 2; 
    margin-left:26px;
  }

  .counter {
    text-align: center;
    width: calc(20% - 20px); 
    padding: 10px;
    background-color: #f2f2f2; 
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    margin-right: 20px; 
  }

  .graph-container {
    margin-top: 20px;
    
    
  }

  .graph {
    width: 80%;
    height: 300px;
    background-color: #f2f2f2;
    margin: 0 auto;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    
  }
  span {
    content: "\002B";
    font-size:95px;
}

font-size:68px;
}

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
    <h2>Dashboard</h2>
    <img src="/img/clogo.png">
  </div>

  
  <div class="counter-container" id="counterContainer">
  
   
 
    <div class="counter">
      <h2>Total Project   ${totalProjects}</h2>
      <p>${dashboardCounters.totalProjects}</p>
      <h1>3</h1>
    
    </div>
    <div class="counter">
      <h2>Closed</h2>
     <p>${closedProjects}</p>
           <h1>2</h1>
     

    </div>
    <div class="counter">
      <h2>Running</h2>
      <p>${runningProjects}</p>
            <h1>1</h1>
      
    </div>
    <div class="counter">
      <h2>Closure Delay</h2>
      <h1>0</h1>
    </div>
    <div class="counter">
      <h2>Cancelled</h2>
      <p>${cancelledProjects}</p>
            <h1>0</h1>
      
    </div>
  </div>

  <div class="graph-container">
    <h2>Department wise - Total Vs Close </h2>
    <div class="graph">
<div id="chartContainer" style="height: 400px; margin-top: 20px;"></div>
    </div>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" integrity="sha512-fDzhg7OvnTEq6qv3JaNcLoVFwpd5Um14LlGGM96B8d5rqOwYQD14u5nmc+Ezml4fLPrL25M2YnxdJSeZfGoibA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
<script>
// Fetch dashboard counters from the backend
fetch('/dashboardCounters')
    .then(response => response.json())
    .then(data => {
        // Update the placeholders with the fetched values
        document.getElementById('totalProjects').textContent = data.totalProjects;
        document.getElementById('closedProjects').textContent = data.closedProjects;
        document.getElementById('runningProjects').textContent = data.runningProjects;
        document.getElementById('cancelledProjects').textContent = data.cancelledProjects;
    })
    .catch(error => {
        console.error('Error fetching dashboard counters:', error);
    });
</script>
<script>
    fetch('/department-wise-data')
        .then(response => response.json())
        .then(data => {
            const categories = data.map(entry => entry.department);
            const seriesData = data.map(entry => entry.successPercentage);
            
            Highcharts.chart('chartContainer', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Department-wise Success Percentage of Projects'
                },
                xAxis: {
                    categories: categories,
                    title: {
                        text: 'Department'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Success Percentage (%)'
                    }
                },
                series: [{
                    name: 'Success Percentage',
                    data: seriesData
                }]
            });
        })
        .catch(error => {
            console.error('Error fetching department-wise data:', error);
        });
</script>


    

</body>
</html>
