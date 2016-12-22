function trim(str)
{
   return (str + '').replace(/(\s+)$/g, '').replace(/^\s+/g, '');
}
// 验证是否图片格式, 此函数不能清空file内容
function isimg(imgpath)
{
   var files = /\.bmp|\.png|\.gif|\.jpeg|\.jpg\b/i;
   // var files = /.bmp|.BMP|.png|.PNG|.gif|.jpg|.GIF|.JPG|.jpeg|.psd|.JPEG\b/;
   if( ! files.test(imgpath))
   {
      return false;
   }
   else return true;
}
// 检查是否是数字
function is_num(num){
	var num_reg = /^[0-9]{0,20}$/;
	if(!num_reg.test(num)){
		return false;
	}else{
		return true;
	}
}
function checkemail(email)
{
   var patrn = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
   if( ! patrn.test(email))
   {
      return false;
   }
   else
   {
      return true;
   }
}
function IsURL(str_url){
	var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
	+ "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" 		// ftp的user@
    + "(([0-9]{1,3}\.){3}[0-9]{1,3}" 									// IP形式的URL-
																		// 199.194.52.184
    + "|" 																// 允许IP和DOMAIN（域名）
    + "([0-9a-z_!~*'()-]+\.)*" 											// 域名-
																		// www.
    + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." 							// 二级域名
    + "[a-z]{2,6})" 													// first
																		// level
																		// domain-
																		// .com
																		// or
																		// .museum
    + "(:[0-9]{1,4})?" 													// 端口-
																		// :80
    + "((/?)|" 															// a
																		// slash
																		// isn't
																		// required
																		// if
																		// there
																		// is no
																		// file
																		// name
    + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
        var re=new RegExp(strRegex);
    if (re.test(str_url)){
        return (true);
    }else{
        return (false);
    }
}
// 获取radio的值
function getRadioVale(radio){
	for(var i=0;i<radio.length;i++){
		if(radio[i].checked){
			return radio[i].value;
		}
	}
}

/*
 * 格式化货币
 * 
 */
function priceFormat(s){
  s = Math.ceil(s * 100)/100;
  s = s.toString();
  if(/[^0-9\.\-]/.test(s))
    return "invalid value";
  s=s.replace(/^(\d*)$/,"$1.");
  s=(s+"00").replace(/(\d*\.\d\d)\d*/,"$1");
  s=s.replace(".",",");
  var re=/(\d)(\d{3},)/;
  while(re.test(s)){
      s=s.replace(re,"$1,$2");
  }
  s=s.replace(/,(\d\d)$/,".$1");
  return s.replace(/^\./,"0.");
}

/**
 * 格式化数字 例如:formatNumber(12,2) 格式化后为12.00
 */
function formatNumber(num,exponent) {
  if (exponent<1) return num;
  var str = num.toString();
  if (str.indexOf(".")!=-1) {
    if (str.split(".")[1].length>=exponent) {
      return str;
    } else {
      return formatNumber(str+"0",exponent);
    }
  } else {
    return formatNumber(str+".0",exponent);
  }
}
/**
 * 限制内容字符个数 例如 CharNUms( content,id,2000); 表单输入框对象 显示字符个数的标签id 最大长度
 */
function CharNums(content, id,maxlength)
{
   if (content.value.length > maxlength )
   {
      content.value = content.value.substring(0, maxlength);
   }
   document.getElementById(id).innerHTML = content.value.length ;
}
/**
 * 过滤各种标题中的非法字符，
 * 
 * 例如：求购信息标题，可以含有汉字，字母，数字，减号，空格，中英文基本标点符号，书名号，等 title="、，。：？！￥%《斯
 * 蒂芬》｛斯蒂芬｝{s斯蒂芬}（sdf斯蒂芬）(斯蒂芬)[]斯蒂芬……斯蒂芬]123,.-?!\\sdf\"'/:";
 */
function check_title(title)
{
	var reg_title=/^[\u4e00-\u9fa5a-zA-Z0-9-\s？！?.!\,\。\[\]\@\#\&\%\$\:\：\｛\｝\（\）\;\；\【\】\(\)\{\}\，\、\'\"\‘\’\“\”\《\》\……\￥\_\\\/]{1,}$/;
	return reg_title.test(title) ;
}
/* 得到字符串的长度，英语字符为1个字符，汉字为两个字符 */
  function len(s) { 
    var l = 0; 
    var a = s.split(""); 
    for (var i=0;i<a.length;i++) { 
	   if (a[i].charCodeAt(0)<299) { 
	      l++; 
	   } else { 
	      l+=2; 
	   } 
    } 
    return l; 
  } 
/**
 * 多级下拉菜单
 * 
 */
function createRegionSelect(){
	/**
	 * 载入一级地区
	 */
	var data = eval(regions);	// json数据
	
	$('select.createSelect').change(function(){
		$(this).nextAll('select.createSelect').remove();	// 将与当前下拉条同级的下面的所有下拉条删除
		var index = $(this).val();					// 获得当前选项的值
		
		var region_next="<option value=''>请选择地区</option>";

		if(index!=undefined){
			// 创建下一个select节点
		    var nextSelect = $("<select class='createSelect'  name = 'region[]' onclick='createRegionSelect()'></select>");
			// 获取数据
		  var  region_arr=data[index];
			// 如果当前值不空，则创建下一个下拉条
			if(region_arr!=undefined){
				$(this).after(nextSelect);
				// 添加选项
				for(var i in region_arr){
					region_next+="<option value='"+region_arr[i].region_id+"'>"+region_arr[i].region_name+"</option>";
				}
				nextSelect.append(region_next);
			}
		}// if
	});	
}

$('#select-regions-1').click(function(){
	if($(this).children().length==1)
	{	
		var region_next='';	
		for(var i in regions['138'])
		{
				region_next+="<option value='"+regions['138'][i].region_id+"' >"+regions['138'][i].region_name+"</option>";
		}
		$(region_next).appendTo($(this));		
	}
});
// 生成多级选择框
// 商城分类
function createSelect(){
	$('.createSelect').change(function(){
		var data = eval(mallcates);							// json数据
		
		$(this).nextAll('.createSelect').remove();	// 将与当前下拉条同级的下面的所有下拉条删除
		var index = $(this).val();					// 获得当前选项的值
		
		if(index != 0){
			// 创建下一个select节点
		    var nextSelect = $("<select  onclick='createSelect()' class='createSelect'  name = 'mallcate[]'></select>");
			// 是否有下一级，0无，1有
		    var has_child=0;
			var region_next="<option value='0'>请选择分类</option>";
		    // 这个for循环是判断此分类是否有子分类，如果有则创建子下拉菜单
		    for(var i in data) {
		 	    if(typeof(data[i]) != "undefined")  {
				    if(data[i].parent_id == $(this).val()) {
				    	if(has_child==0){
				    		// 将下一个下拉条节点加入DOM
				    		 $(this).after(nextSelect);
					    	 has_child=1;
				    	}
					    region_next+="<option value='"+data[i].cate_id+"'>"+data[i].cate_name+"</option>";
				    }
			    }
		    }
		    // 创建下拉选项
		    nextSelect.append(region_next);
		}// if
	});	
}
// 添加第一级分类
$('#select-mallcates-1').click(function(){
	if($(this).children().length==1)
	{	
		var region_next='';	
		for(var i in mallcates)
		{
			if(mallcates[i].parent_id == '0'){
				region_next+="<option value='"+mallcates[i].cate_id+"' >"+mallcates[i].cate_name+"</option>";
			}
		}
		$(region_next).appendTo($(this));		
	}
});
/**
 * 
 * 编辑多级下拉框，自动选项
 * 
 * value_arr 为信息数组，包含所有信息 value 为当前要编辑信息的各级下拉框的值 type
 * 为类型，例如：type="regions"为地区编辑，type="mallcates"为分类编辑
 * 
 * 例如：var regions = <?php echo Zend_Json::encode($regions)?>; var region_address =
 * <?php echo Zend_Json::encode($region_address)?>;//为要编辑的信息中的地区信息
 * editAddress(regions,region_address,"regions");
 */
function editSelectInfo(value_arr,value,type){
	for (var i in value){
		if(type=='regions'){
			lev = value_arr [i].lev;
		}
		if(type=='mallcates'){
			lev = value_arr [i].level;
		}
		id = "select-"+type+"-"+lev;// 下拉框ID
		$("select[id='"+id+"'] option[value='"+i+"']").attr("selected","selected");
	}
}
/*
 * 得到字符串的长度，英语字符为1个字符，汉字为两个字符 s 要得到长度的字符串
 * 
 */
function len(s) { 
	var l = 0; 
	var a = s.split(""); 
	for (var i=0;i<a.length;i++) { 
	   if (a[i].charCodeAt(0)<299) { 
	      l++; 
	   } else { 
	      l+=2; 
	   } 
	} 
	return l; 
}

/**
 * 获取焦点时生成验证码 验证码初始化格式 <img src='' id='captcha_img' class='hide'
 * onclick='changeCaptcha()' title='看不清，点击更新图片' style='cursor:pointer' />
 */
function showCaptcha()
{
	if($("#captcha_img").attr('src')==''){
		$("#captcha_img").attr('src',"/admin/profile/captcha/random/"+Math.random());
		$("#captcha_img").show();
	}	
}

// 失去焦点时ajax验证验证码输入是否正确
function checkCaptcha(){
	var profile=$.trim($('#profile').val());
	if(profile=='') return;
	
	if(!profile.match(/^[0-9a-zA-Z]{4}$/)){
		alert('验证码输入不正确');
		$('#profile').val('');	
		$('#profile').focus();	
	}else{
		$.ajax({
			 async:false,
			 url:'/register/checkprofile',
			 type :'GET',
			 data:{profile:$('#profile').val()},
			 success:function(data){
				if(data=='no'){
					alert('验证码输入不正确');
					$('#profile').val('');	
					$('#profile').focus();	
				}
				else return true;
			 }
		});
	}
}

// 更换验证码
function changeCaptcha()
{
	$("#captcha_img").attr("src","/admin/profile/captcha/random/"+Math.random());
	$('#profile').val('');	
}


// 截取中英文混合字符串
function substr(str, len) 
{ 
    if(!str || !len) { return ''; } 
 
    // 预期计数：中文2字节，英文1字节
    var a = 0; 
 
    // 循环计数
    var i = 0; 
 
    // 临时字串
    var temp = ''; 
 
    for (i=0;i<str.length;i++) 
    { 
        if (str.charCodeAt(i)>255)  
        { 
            // 按照预期计数增加2
            a+=2; 
        } 
        else 
        { 
            a++; 
        } 
        // 如果增加计数后长度大于限定长度，就直接返回临时字符串
        if(a > len) { return temp+"..."; } 
 
        // 将当前内容加到临时字符串
        temp += str.charAt(i); 
    } 
    // 如果字符串长度小于目标长度直接返回
    return str; 
}

/**
 * 检测浏览器是否支持cookie功能
 */
function CookieEnable()   {   
	var result=false;   
	if(navigator.cookiesEnabled)  return true;   
	document.cookie = "testcookie=yes;";   
	var cookieSet = document.cookie;   
	if (cookieSet.indexOf("testcookie=yes") > -1)  result=true;   
	document.cookie = "";   
	return result;   
}   
