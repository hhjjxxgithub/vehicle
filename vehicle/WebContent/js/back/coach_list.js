/**
 * 
 */
		var table;
		$(function(e) {
			/* 数据初始化 */
			$("#coachState").append(
				$("<option value='1'>"+param[1]+"</option>"+
				  "<option value='2'>"+param[2]+"</option>")
			);
			/*表格插件初始化 */
			table = $('#example').DataTable({
				ajax:{
					url:path+"/back/coach/getBySchool.handler",
					dataSrc: ""
				},
				columns:[
					{data:'COACH_ACCOUNT'},
					{data:'COACH_NAME'},
					{data:'COACH_PHONE'},
					{data:'SCHOOL_NAME'},
					{
						data:'COACH_STATE',
						"render": function ( data, type, full, meta ) {
							return '<span>'+param[data]+"</span>";
						}
					},
					{
						data:null,
						"render": function ( data, type, full, meta ) {
							return "<button type='button' class='btn btn-default'"+ 
								"onClick='modify("+full.COACH_ID+")'>修改</button>"+
								"<button type='button' onClick='del("+full.COACH_ID+")'"+ 
								"class='btn btn-default'>删除</button>";
						}
					}
				]
			});
			/*修改验证插件初始化 */
			$("#form").Validform({
			    tiptype: 2,
			    ajaxPost: true,
			    beforeSubmit: function (curform) {
			        $.ajax({
			            type: 'post',
			            url: path+"/back/coach/update.handler",
			            contentType: 'application/json',
			            data: JSON.stringify($("#form").serializeJSON()),
			            success: function (data) {
			                if (data != 'y') {
			                    window.alert("修改成功");
			                    $("#myModal").modal("hide");
			                    table.ajax.reload();
			                    table.draw(false);
			                } else {
			                    window.alert("修改失败");
			                }
			            }
			        })
			        return false;
			    }
			});
			
			/*添加验证插件初始化 */
			$("#addform").Validform({
			    tiptype: 2,
			    ajaxPost: true,
			    beforeSubmit: function (curform) {
			        $.ajax({
			            type: 'post',
			            url: path+"/back/coach/add.handler",
			            contentType: 'application/json',
			            data: JSON.stringify($("#addform").serializeJSON()),
			            success: function (data) {
			                if (data != 'y') {
			                    window.alert("新增成功");
			                    $("#addModal").modal("hide");
			                    table.ajax.reload();
			                    table.draw(false);
			                } else {
			                    window.alert("新增失败");
			                }
			            }
			        })
			        return false;
			    }
			});
			
		});
		/* 进入修改页面前 */
		function modify(id) {
			$.ajax({
				 url :path+"/back/coach/getById.handler",
			     async : true,
			     type : "POST",
			     data : {coachId:id},
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
			$("#coachId").val(data.coachId);
			$("#coachName").val(data.coachName);
			$("#coachPhone").val(data.coachPhone);
			$("#coachCard").val(data.coachCard);
			$($("#coachState option[value='"+data.coachState+"']")[0]).attr('selected','true');
			$("#myModal").modal('show');
		}
		/*关闭模态框清空数据*/
		$("#myModal").on('hidden.bs.modal', function () {
			$("#form").Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
		});
		$("#addModal").on('hidden.bs.modal', function () {
			$("#addform").Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
		});
		
		/* 删除 */
		function del(id){
			var flag = window.confirm("确定删除？");
			if(flag){
				$.ajax({
		            type: 'post',
		            url: path+"/back/coach/delete.handler",
		            data: {coachId:id},
		            success: function (data) {
		                if (data != 'y') {
		                    window.alert("删除成功");
		                    table.ajax.reload();
		                    table.draw(false);
		                } else {
		                    window.alert("删除失败");
		                }
		            }
		        })
			}
		}