/**
 * @author dao
 * @version 1.0
 * @copyright 信1305_20132997_王荣道
 */

function messShow(obj){
    var user = document.getElementById(obj);
    user.style.display = "block";
}

function messHidden(obj){
    var user = document.getElementById(obj);
    user.style.display = "none";
}

function messTShow(){
    var user = document.getElementById("topicShow");
    user.style.display = "block";
}

function messTHidden(){
    var user = document.getElementById("topicShow");
    user.style.display = "none";
}

function closelogin(){
	var user = document.getElementById("login");
	user.style.display = "none";
}

function showlogin(){
	var user = document.getElementById("login");
	user.style.display = "block";
}

function replyCheck(){
    var replyContent = document.getElementById("replyContent");
    if (replyContent.value.length > 4 && replyContent.value.length < 2000) {
        return true;
    }
    else {
        alert("不能小于5个或大于2000个字符");
        return false;
    }
}
