package com.mains;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mains.bin.ListingData;
import com.mains.reposority.ClientRepositry;


public class admhandeler {


@Autowired
private ClientRepositry repo;


@RequestMapping("/record2")
public String getData(Model m) {
    List<ListingData> li = repo.findAll();
    m.addAttribute("e_data",li);  
    System.out.println(li);
    return "updated";
}


 

   
}
