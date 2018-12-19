/**
 * 
 */
		var table;
		$(function(e) {
			/* 数据初始化 */
//			$("#coachState").append(
//				$("<option value='1'>"+param[1]+"</option>"+
//				  "<option value='2'>"+param[2]+"</option>")
//			);
			/*表格插件初始化 */
			table = $('#example').DataTable({
				ajax:{
					url:path+"/back/user/userList.handler",
					dataSrc: ""
				},
				columns:[
					{data:'USER_ID'},
					{data:'USER_NAME'},
					{data:'USER_STATE'},
					{data:'COACH_NAME'},
					{data:'SCHOOL_NAME'},
					{data:'LEVEL_NAME'},
					{
						data:null,
						"render": function ( data, type, full, meta ) {
							if(full.COACH_NAME==null){
								return "<button type='button' class='btn btn-sm btn-danger m-b-5 m-t-5'"+ 
								"onClick='del("+full.USER_ID+")'>删除</button>"+
								"<button type='button' onClick='allo("+full.USER_ID+")'"+ 
								"class='btn btn-sm btn-warning m-b-5 m-t-5'>分配教练</button>"+
								"<button type='button' onClick='study("+full.USER_ID+")'"+ 
								"class='btn btn-sm btn-primary m-b-5 m-t-5'>学时查看</button>";
							}else {
								return "<button type='button' class='btn btn-sm btn-danger m-b-5 m-t-5'"+ 
								"onClick='del("+full.USER_ID+")'>删除</button>"+
								"<button type='button' onClick='study("+full.USER_ID+")'"+ 
								"class='btn btn-sm btn-primary m-b-5 m-t-5'>学时查看</button>";
							}
						}
					}
				]
			});
		});
		/* 进入修改页面前 */
		function allo(id) {
			$.ajax({
				 url :path+"/back/user/allotCoachOne.handler",
			     async : true,
			     type : "POST",
			     data : {userId:id},
			     dataType:'json',
			     success :function(data){
					if(data.status == 'y'){
						show(data.info);
					}
			     }
			})
		}
		/* 数据填充并显示模态框*/
		function show(data){
			$("#userId").val(data[0].USER_ID);
			$("#userName").val(data[0].USER_NAME);
			$("#schoolId").val(data[0].SCHOOL_ID);
			$("#schoolName").val(data[0].SCHOOL_NAME);
			$("#myModal").modal('show');
		}
		
		function coach(){
			$.ajax({
				type:'post',
				url:path+"/back/coach/frontAllotCoach.handler",
				data:{schoolId:$("#schoolId").val()},
				dataType:'json',
				success:function(data){
					if(data.status == 'y'){
					$("#coachChoose").empty();
					var str = "";
					for(var i=0;i<data.info.length;i++){
						str += "<option value="+data.info[i].COACH_ID+">"+data.info[i].COACH_NAME+"</option>";
					}
					$("#coachChoose").append(str);
					}
				}
				
			})
			
		}
		/*关闭模态框清空数据*/
/*		$("#myModal").on('hidden.bs.modal', function () {
			$("#form").Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
		});
		$("#addModal").on('hidden.bs.modal', function () {
			$("#addform").Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
		});*/
		
		/*学员管理分配教练*/
		function onSub(){
			$.ajax({
				type:'post',
				url:path+"/back/user/allotCoach.handler",
				data:$("#form").serialize(),
				dataType:'json',
				success:function(data){
					if(data.status=='y'){
						 window.alert(data.info);
						 table.ajax.reload();
						 table.draw(false);
					}else {
						 window.alert(data.info);
					}
				}
			})
		}
		
		/*学员管理删除*/
		function del(id){
			$.ajax({
				type:'post',
				url:path+"/back/user/deleteUser.handler",
				data:{userId:id},
				dataType:'json',
				success:function(data){
					if(data.status=='y'){
						 window.alert(data.info);
						 table.ajax.reload();
						 table.draw(false);
					}else {
						 window.alert(data.info);
					}
				}
			})
		}
		
		function study(id){
			$.ajax({
				type:'post',
				url:path+"/back/period/studyTime.handler",
				data:{userId:id},
				dataType:'json',
				success:function(data){
					var str = "";
					if(data.status=='y'){
						$("#seeTime").empty();
						for(var i=0;i<data.info.length;i++){
							str += "<input type='text' class='form-control' required='true' value='"+data.info[i].LEVEL_NAME+"&nbsp;&nbsp;学时:"+data.info[i].PERIOD_LENGTH+"'>";
						}
						$("#seeTime").html(str);
						$("#studyTime").modal('show');
					}else {
						 window.alert(data.info);
					}
				}
			})
		}
		
