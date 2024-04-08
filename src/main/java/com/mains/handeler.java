package com.mains;

 

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mains.bin.DashCounter;
import com.mains.bin.ListingData;
import com.mains.reposority.ClientRepositry;


@Controller
public class handeler{
	
	@Autowired
	
	private ClientRepositry repo;
	
	
	
    @RequestMapping("/")
    public String displayLoginPage() {
        return "login"; 
    }
    
    /*!--Authorized User Login Handaler*/
    
    @RequestMapping("/users")
    public String userpage(String email, String password) {
        String correctEmail = "pawan@gmail.com";
        String correctPassword = "prime123";

        if (email.equals(correctEmail) && password.equals(correctPassword)) {
            return "dashboard";
        } else {

            return "redirect:/"; // Redirect back to login page if credentials are incorrect
        }
    }
    /*Add Project Handaler*/
    @RequestMapping("/add")
    public String addproject() {
        return "createproject"; 
    }
 
    @RequestMapping("/dash")
    public String displaydashboard(Model model) {
        // Add dashboard counters to the model
        return "dashboard";
    }
    
    
    /* Handeler for Save Form Data*/
    
    @PostMapping("/save")
	public String data(@ModelAttribute ListingData list) {
	    System.out.println(list);
	    repo.save(list);
	    return "data";
	}
    
    /* Handeler for Fench Data*/
    

	@RequestMapping("/showdata")
	public String getData(Model m) {
	    List<ListingData> li = repo.findAll();
	    m.addAttribute("e_data",li);  
	    System.out.println(li);
	   
	    return "record";
	}
	
	/*Status Updation*/
	
	 @PostMapping("/run/{id}")
	    public String handleAction(@ModelAttribute ListingData listingData, @RequestParam("action") String action) {
	        ListingData project = repo.findById(listingData.getId()).orElse(null);
	        if (project != null) {
	            if (action.equals("start")) {
	                project.setStatus("Running");
	            } else if (action.equals("close")) {
	                project.setStatus("Closed");
	            } else if (action.equals("cancel")) {
	                project.setStatus("Cancelled");
	            }
	            repo.save(project); 
	        }
	        return "redirect:/showdata";
	    }
	 
	 

	 @GetMapping("/dashboardCounters")
	 @ResponseBody
	 public Map<String, Long> getDashboardCounters() {
	     Map<String, Long> counters = new HashMap<>();
	     counters.put("totalProjects", repo.count());
	     counters.put("closedProjects", repo.countByStatus("Closed"));
	     counters.put("runningProjects", repo.countByStatus("Running"));
	     counters.put("cancelledProjects", repo.countByStatus("Cancelled"));
	     return counters;
	 }



@GetMapping("/department-wise-data")
@ResponseBody
public List<Map<String, Object>> getDepartmentWiseData() {
    List<Object[]> departmentWiseCounts = repo.getDepartmentWiseCounts();
    List<Map<String, Object>> data = new ArrayList<>();

    for (Object[] obj : departmentWiseCounts) {
        String department = (String) obj[0];
        Long totalProjects = (Long) obj[1];
        Long closedProjects = (Long) obj[2];
        
        double successPercentage = totalProjects == 0 ? 0 : (double) closedProjects / totalProjects * 100;

        Map<String, Object> departmentData = new HashMap<>();
        departmentData.put("department", department);
        departmentData.put("totalProjects", totalProjects);
        departmentData.put("closedProjects", closedProjects);
        departmentData.put("successPercentage", successPercentage);

        data.add(departmentData);
    }

    return data;
    
    
}


}


