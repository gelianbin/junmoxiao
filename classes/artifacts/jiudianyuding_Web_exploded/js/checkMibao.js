var question=null;
	var pwd=null;
	function checkuname() {
		var name = $("#username").val();
		if(name==""||(name.length<3||name.length>12)){
			 $("#checku").html("用户账号不能为空且长度在3～12位之间！");
			 $("input[id=username]").focus();
		} else {
			$("#checku").html("");
			$.ajax({
				url : "checkMiBao.do",
				type : "post",
				data : "uname=" + name,
				
				dataType : "json",
				success:function(result){
				if(result.info=="ok"){
					//alert("ddd");
				$("#mibao1").show();
				$("#mibao2").show();
				//$("#checku").html("用户名在，请更换！");
				//$("input[id=mbanswer]").html(result.answer);
				//alert(result.answer);
				//$("#mbanswer").html("ddd");
				$("#mbanswer").val(result.answer);
				$("input[id=mbquestion]").val(result.question);
				question=result.question;
				pwd=result.pwd;
				return false;
				}else{
				$("#checku").html("用户名错误，请重新输入！");
				$("input[id=username]").val("");
				$("input[id=username]").focus();
				return true;
				}
				},
				error:function(){
				alert("系统处理中！");
				return false;
				}

			});
		}

	}
	 
		 function checkMiBao(){
		 var mbquestion=$("#txtquestion").val();
		
		 if(mbquestion==""){
			 
		  $("#prompt_question").html("密保答案不能为空！");
		  $("input[id=prompt_question]").focus();
		  return false;
		  }else{
			  //alert(mbquestion);
			  //alert(question);
			 // alert(mbquestion==question);
			  if(mbquestion==question){
				  //alert("ffff");
				$("#prompt_question").html("您的密码是："+pwd);  
			  }else{
				 $("#prompt_question").html("你输入的密保答案错误，请重新输入：");  
				 $("#prompt_question").focus();				 
			  }
		   
		  return true;
		  }

		 
	}