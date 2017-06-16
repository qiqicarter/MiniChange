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
.form-bak{width:800px;height:400px;margin:40px auto;background:#eee;border-radius:10px;box-shadow:0 2px 8px #999;}
.left{float:left;width:500px;height:400px;}
.line{width:100%;height:80px;margin:16px 0 0 0;}
.info{float:left;height:100%;width:200px;}
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

<div id="top"><h1>${text}</h1></div>
<div id="top"><h2>${last}</h2></div>

</body>
</html>