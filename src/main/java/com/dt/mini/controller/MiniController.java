package com.dt.mini.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dt.mini.model.TChange;
import com.dt.mini.service.ChangeService;

@Controller
@RequestMapping("/")
public class MiniController {
	@Autowired
	ChangeService service;
	
	@RequestMapping("/gift")  
	public String gift(Model model){
		return "/gift";
	}
	
	@RequestMapping("/change")  
	public String checkAndSaveSign(String name,String user,String days,String udays,String remark,Model model){
		TChange change = service.getUserLeastChange(user);
		if(change==null){//无兑换记录
			TChange record = new TChange();
			record.setDays(Integer.parseInt(days));
			record.setName(name);
			record.setRemark(remark);
			record.setUdays(Integer.parseInt(udays));
			record.setUser(user);
			
			service.addChangeRecord(record);
			
			model.addAttribute("text", "满足兑换条件，可以兑换");
			model.addAttribute("last", "这是该用户第一次兑换");
			return "/res";
		}else if(Integer.parseInt(udays)<Integer.parseInt(days)){
			model.addAttribute("text", "注意：不满足兑换条件，不可以兑换");
			model.addAttribute("last", "当前连续签到数小于兑换需要的连续签到数");
			return "/res";
		}
		
		Date now = new Date();
		long timeGap = now.getTime()-change.getCreateDate().getTime();
		
		return "/gift";
	}
}
