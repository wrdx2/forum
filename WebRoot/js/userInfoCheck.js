/**
 * @author dao
 * @version 1.0
 * @copyright 信1305_20132997_王荣道
 */
var userInfo = {
    formName: "modifyUserInfo",
    emailName: "email",
    pwdName: "password2",
    repwdName: "password",
    
    init: function(){
        oform = document.forms[userInfo.formName];
        email = oform[userInfo.emailName];
        pwd = oform[userInfo.pwdName];
        repwd = oform[userInfo.repwdName];
        
        emailTips = email.nextSibling.nextSibling;
        pwdTips = pwd.nextSibling.nextSibling;
        repwdTips = repwd.nextSibling.nextSibling;
        
        userInfo.addEventHandler(email, "change", userInfo.emailCheck);
        userInfo.addEventHandler(pwd, "change", userInfo.pwdCheck);
        userInfo.addEventHandler(repwd, "change", userInfo.repwdCheck);
        
        
    },
    emailCheck: function(){
        if ((/^\w+@\w+(.\w+){1,2}$/).test(email.value)) {
            emailTips.innerHTML = "正确";
            return true;
        }
        else {
            emailTips.innerHTML = "<font color=red><b>  邮箱格式错误</b></font>";
            return false;
        }
        
    },
    pwdCheck: function(){
        if ((pwd.value).match(/^.{6,}$/)) {
            pwdTips.innerHTML = "正确";
            return true;
        }
        else {
            pwdTips.innerHTML = "<font color=red><b>  请按要求输入密码</b></font>";
            return false;
        }
        
    },
    repwdCheck: function(){
        if (pwd.value == repwd.value) {
            repwdTips.innerHTML = "输入一致";
            return true;
        }
        else {
            repwdTips.innerHTML = "<font color=red><b>  两次密码输入不一致</b></font>";
            return false;
        }
    },
    checkValidation: function(){
        if (userInfo.emailCheck() && userInfo.pwdCheck() && userInfo.repwdCheck()) {
        	oform["submit"].disabled = false;
            return true;
        }
        else {
            return false;
        }
    },
    
    /**
     *
     * @param {Object} oTarget	the target of the event
     * @param {Object} sEventType	the type of the event
     * @param {Object} fnHandler	the Distribution function
     */
    addEventHandler: function(oTarget, sEventType, fnHandler){
        if (oTarget.addEventListener) {
            oTarget.addEventListener(sEventType, fnHandler, false);
        }
        else 
            if (oTarget.attachEvent) {
                oTarget.attachEvent("on" + sEventType, fnHandler);
            }
            else {
                oTarget["on" + sEventType] = fnHandler;
            }
    }
};
window.onload = userInfo.init;
