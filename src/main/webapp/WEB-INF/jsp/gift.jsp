<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"  %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>礼品兑换登记</title>

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<style type="text/css">
*{font-family:"微软雅黑","黑体","宋体";color:#333;}
a{color:#069;}
body{margin:0;padding:0;background:#ddd;}
.form-bak{width:850px;height:500px;margin:40px auto;background:#eee;border-radius:10px;box-shadow:0 2px 8px #999;}
.left{float:left;width:550px;height:400px;}
.line{width:100%;height:80px;margin:16px 0 0 0;}
.info{float:left;height:100%;width:250px;}
.info strong, .info span{display:block;text-align:right;}
.info strong{font-size:24px;line-height:36px;margin-top:10px;color:#333;}
.info span{font-size:12px;line-height:24px;color:#666;font-family:"微软雅黑","宋体";}
.input input{background:none;border:none;outline:none;font-size:18px;line-height:40px;height:40px;width:240px;padding:9px 0 9px 9px;border-radius:10px;}
.input{float:right;width:278px;height:58px;background:#f6f6f6;border:1px solid #999;border-radius:10px;box-shadow:inset 0 2px 5px #999;margin:10px 0;position:relative;}
.error,.corect{height:20px;width:20px;position:absolute;top:19px;right:9px;background:url("js/ICON_20.svg") no-repeat 0 -20px;}
.error span{display:block;position:absolute;top:30px;right:20px;background:#fcc;border:1px solid #f33;font-size:12px;line-height:16px;color:#600;padding:6px 10px 4px 10px;border-radius:5px;opacity:.8;white-space:nowrap;overflow:hidden;}
.corect{background-position:0 0;}
.corect span{display:none;}
.none{display:none;}

.right{float:right;width:260px;height:360px;margin:20px 0 0 0;border-left:1px solid #ccc;}
input[type=submit]{background:none;border:none;outline:none;margin:0;padding:0;cursor:pointer;
font-size:40px;height:200px;width:200px;background:#369;margin:20px 30px 0 30px;color:#eee;}
input[type=submit]:disabled{background:#999;cursor:no-drop;}
.right div{margin:0 30px;width:200px;height:30px;line-height:30px;text-align:center;}
.readagreement-wrap{margin:20px 30px!important;outline:1px solid #f99;}

#top h1{font-size:30px;line-height:40px;padding:10px;text-align:center;}
.agreement,#top{width:800px;margin:20px auto;background:#eee;border-radius:10px;box-shadow:0 2px 8px #999;text-align:center;}
.agreement h1{display:block;font-size:24px;line-height:30px;padding:20px 20px 10px 20px;margin:0;color:#333;text-align:center;}
.agreement iframe{width:760px;min-height:400px;margin:0 20px 20px 20px;border:none;outline:none;}
.agreement .backtotop{display:block;line-height:20px;padding:10px;text-align:center;}
</style>

</head>
<body>

<div id="top"><h1>礼品兑换登记</h1></div>

<div class="form-bak">
	<form method="post" action="change" onsubmit="adaptValue();">
		<div class="left">
			<div class="line" id="line_account">
				<div class="info">
					<strong>姓名</strong>
					<span class="tips">兑换用户的真实姓名</span>
				</div>
				<div class="input">
					<input type="text" name="name" id="name"/>
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_name">
				<div class="info">
					<strong>微信/QQ</strong>
					<span class="tips">请输入签到的账号所对应的微信或者QQ</span>
				</div>
				<div class="input">
					<input type="text" name="user" id="user"/>
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_name">
				<div class="info">
					<strong>兑换所需连续签到日</strong>
					<span class="tips">如兑换10天连续签到礼，请输入“10”</span>
				</div>
				<div class="input">
					<input type="text" name="days" id="days" />
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_name">
				<div class="info">
					<strong>用户当前连续签到日</strong>
					<span class="tips">如用户当前连续签到20天，请输入“20”</span>
				</div>
				<div class="input">
					<input type="text" name="udays" id="udays" />
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_name">
				<div class="info">
					<strong>备注</strong>
					<span class="tips"></span>
				</div>
				<div class="input">
					<input type="text" name="remark" id="remark"  />
					<div class="none"><span></span></div>
				</div>
			</div>
			
		</div>
		
		<div class="right">
			<input type="submit" id="submit" value="兑换" disabled="disabled"/>
			<div class="readagreement-wrap" onclick="onReadAgreementClick();">
				<input type="checkbox" name="agree" id="agree" onchange="v_submitbutton();" />
				确认输入正确，兑换
			</div>
		</div>
	</form>
</div>


<script type="text/javascript">
function enableSubmit(bool){
	if(bool)$("#submit").removeAttr("disabled");
	else $("#submit").attr("disabled","disabled");
}

function v_submitbutton(){
	if($("#agree").attr("checked")!="checked") {
		enableSubmit(false);
		$(".readagreement-wrap").css("outline","1px solid #f99");
		return;
	}else{
		$(".readagreement-wrap").css("outline","1px solid #9f9");
	}
	enableSubmit(true);
}


function agree(){
	$("#agreement").hide();
	$("#readagreement").attr("onclick","showAgreement();");
	if($("#agree").attr("checked")!="checked") $("#agree").trigger("click");
}

function onReadAgreementClick(){
	return;
	if($("#agree").attr("checked")){
		$("#agree").removeAttr("checked");
	}else{
		$("#agree").attr("checked","checked");
	}
	v_submitbutton();
}

var flags = [false,false,false,false];

//邮箱验证，网上找到的正则
var RegEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;

function lineState(name,state,msg){
	if(state=="none"){$("#line_"+name+" .input div").attr("class","none"); return;}
	if(state=="corect"){$("#line_"+name+" .input div").attr("class","corect");return;}
	$("#line_"+name+" .input span").text(msg);$("#line_"+name+" .input div").attr("class","error");
}


function adaptValue(){
	return true;
}
</script>
</body>
</html>