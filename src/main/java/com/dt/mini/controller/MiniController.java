package com.dt.mini.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
			if(Integer.parseInt(udays)>=Integer.parseInt(days)){
				model.addAttribute("text", "满足兑换条件，可以兑换");
				model.addAttribute("last", "这是该用户第一次兑换");
				
				insertChange(days, name, remark, udays, user);
				return "/res";
			}else{
				model.addAttribute("text", "注意：不满足兑换条件，不可以兑换");
				model.addAttribute("last", "当前连续签到数小于兑换需要的连续签到数");
				return "/res";
			}
			
		}else if(Integer.parseInt(udays)<Integer.parseInt(days)){
			model.addAttribute("text", "注意：不满足兑换条件，不可以兑换");
			model.addAttribute("last", "当前连续签到数小于兑换需要的连续签到数");
			return "/res";
		}else{
			model.addAttribute("text", "注意：不满足兑换条件，不可以兑换");
			model.addAttribute("last", "上次兑换时间为："+getFormatTime(change.getCreateDate()));
		}
		
		Date lastStartTime = getNextDay(change.getCreateDate(), change.getUdays());
		Date thisStartTime = getNextDay(new Date(),Integer.parseInt(udays));
		
		if(getZeroTime(thisStartTime).getTime()==getZeroTime(lastStartTime).getTime()){//非第一次兑换,这次兑换的连续签到的第一天和上次兑换的连续签到第一天是同一天
			if(Integer.parseInt(udays)>=(change.getDays()+Integer.parseInt(days))){
				model.addAttribute("text", "满足兑换条件，可以兑换");
				model.addAttribute("last", "上次兑换时间为："+getFormatTime(change.getCreateDate()));
				
				insertChange(days, name, remark, udays, user);
				return "/res";
			}
		}else{
			if(Integer.parseInt(udays)>=Integer.parseInt(days)){
				model.addAttribute("text", "满足兑换条件，可以兑换");
				model.addAttribute("last", "上次兑换时间为："+getFormatTime(change.getCreateDate()));
				
				insertChange(days, name, remark, udays, user);
				return "/res";
			}
		}
		return "/res";
	}
	
	
	public Date getNextDay(Date date,int days) {  
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(date);  
        calendar.add(Calendar.DAY_OF_MONTH, -days);  
        date = calendar.getTime();  
        return date;  
    } 
	
	public Date getZeroTime(Date date){
		Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        Date zero = calendar.getTime();
        return zero;
	}
	
	public String getFormatTime(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		
		return sdf.format(date);
	}
	
	public void insertChange(String days,String name,String remark,String udays,String user){
		TChange record = new TChange();
		record.setDays(Integer.parseInt(days));
		record.setName(name);
		record.setRemark(remark);
		record.setUdays(Integer.parseInt(udays));
		record.setUser(user);
		
		service.addChangeRecord(record);
	}
}
