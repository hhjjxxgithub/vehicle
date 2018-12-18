/**
 * 
 */
		var table;
		$(function(e) {
			/*表格插件初始化 */
			table = $('#example').DataTable({
				ajax:{
					url:path+"/back/parameter/parameterList.handler",
					dataSrc: ""
				},
				columns:[
					{data:'parameterState'},
					{data:'parameterName'},
					{data:'parameterMark'},
					{
						data:null,
						"render": function ( data, type, full, meta ) {
							return "<button type='button' class='btn btn-default'"+ 
								"onClick=modify("+full.parameterId+",'"+full.parameterState+
								","+full.parameterMark+"')>修改</button>"+
								"<button type='button' onClick='del("+full.parameterId+")'"+ 
								"class='btn btn-default'>删除</button>";
						}
					}
				]
			})
			/*修改验证插件初始化 */
			$("#form").Validform({
			    tiptype: 2,
			    ajaxPost: true,
			    datatype:{
					'vali1':function(gets,obj,curform,regxp){
						return exist('1');
					}
				},
			    beforeSubmit: function (curform) {
			        $.ajax({
			            type: 'post',
			            url: path+"/back/parameter/update.handler",
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
				datatype:{
					'vali2':function(gets,obj,curform,regxp){
						return exist('2');
					}
				},
			    beforeSubmit: function (curform) {
			        $.ajax({
			            type: 'post',
			            url: path+"/back/parameter/add.handler",
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
		})
		/* 存在验证 */
		function exist(i){
			var reg=/^[1-9][0-9]*$/;
			if(!reg.test($("#parameterState"+i).val())){return false}	
			if(i == '1'){
				var now = $("#parameterState"+i).val()+","+$("#parameterMark"+i).val();
				if(now == $("#key").val()){return true}
			}
			var flag = false;
			$.ajax({
	            type: 'post',
	            async:false,
	            url: path+"/back/parameter/exist.handler",
	            data: {parameterState:$("#parameterState"+i).val(),
	            	parameterMark:$("#parameterMark"+i).val()
	            },
	            success: function (data) {
	            	flag = data.status == 'y'?true:false;
	            }
	        })
	        return flag;
		}
		/* 进入修改页面前 */
		function modify(id,key) {
			$.ajax({
				 url :path+"/back/parameter/getById.handler",
			     async : true,
			     type : "POST",
			     data : {parameterId:id},
			     dataType:'json',
			     success :function(data){
					if(data.status == 'y'){
						show(data.info);
						$("#key").val(key);
					}
			     }
			})
		}
		/* 数据填充并显示模态框*/
		function show(data){
			$("#parameterId").val(data.parameterId);
			$("#parameterState1").val(data.parameterState);
			$("#parameterName").val(data.parameterName);
			$($("#parameterMark1 option[value='"+data.parameterMark+"']")[0]).attr('selected','true');
			$("#myModal").modal('show');
		}
		/* 删除 */
		function del(id){
			var flag = window.confirm("确定删除？");
			if(flag){
				$.ajax({
		            type: 'post',
		            url: path+"/back/parameter/delete.handler",
		            data: {parameterId:id},
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
		/*关闭模态框清空数据*/
		$("#myModal").on('hidden.bs.modal', function () {
			$("#form").Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
		});
		$("#addModal").on('hidden.bs.modal', function () {
			$("#addform").Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
		});