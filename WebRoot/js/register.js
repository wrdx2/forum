var msg=new Array();
msg[0]="请输入验证码";
msg[1]="数据校验中";
msg[2]="验证码错误，请重新输入";
msg[3]="验证码正确";
//验证码
$("#code").focus(function(){
	$("#codeTip").attr("class","onFocus").html(msg[0]);
}).blur(function(){
	check_code();
});
function register_submit(){
	if(check_code()){
		return true;
	}else{
		return false;
	}
}
function check_code(){
	var code = $("#code").val();
	if(code == ""){
		$("#codeTip").attr("class","onError").html(msg[2]);
		return false;
	}
	if(code.length != 4 || !/\w{4}/.test(code)) {
		$("#codeTip").attr("class","onError").html(msg[2]);
		return false;
	}
	$("#codeTip").attr("class","onLoad").html(msg[1]);
	if(ajax(code) == "no"){
		$("#codeTip").attr("class","onError").html(msg[2]);
		return false;
	}else {
		$("#codeTip").attr("class","onCorrect").html(msg[3]);
		return true;
	}
}
function ajax(code){
	var value;
	$.ajax({
	   type: "get",
	   async:false,//发送同步请求信息,等待服务器返回数据
	   url: "/register/checkprofile",
	   data: "profile="+code,
	   success: function(msg){
	     value = msg;
	   }
	}); 
	return value;
}