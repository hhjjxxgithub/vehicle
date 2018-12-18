/**
 * 
 */
var table;
		$(function(e) {
			/*表格插件初始化 */
			table = $('#example').DataTable({
				ajax:{
					url:path+"/back/subject/subjectList.handler",
					dataSrc: ""
				},
				columns:[
					{data:'SUBJECT_TITLE'},
					{data:'LEVEL_NAME'},
					{
						data:null,
						"render": function ( data, type, full, meta ) {
							return "<span>"+param[full.SUBJECT_STATE]+"</span>"
						}
					},
					{
						data:null,
						"render": function ( data, type, full, meta ) {
							return "<button type='button' class='btn btn-default'"+ 
								"onClick=modify("+full.SUBJECT_ID+")>修改</button>"+
								"<button type='button' onClick='del("+full.SUBJECT_ID+")'"+ 
								"class='btn btn-default'>删除</button>";
						}
					}
				]
			})
			/*修改验证插件初始化 */
			$("#form").Validform({
			    tiptype: 2,
			    ajaxPost: true,
			    beforeSubmit: function (curform) {
			    	if($("#select1").val() == 1){
			    		var name = $($("#answer11 option:selected")[0]).attr("name");
			    		$("#answer11").attr('name',name);
			    		$(".answer12").attr('disabled','true');
			    	}else{
			    		$("#answer11").attr('disabled','true');
			    	}
			        $.ajax({
			            type: 'post',
			            url: path+"/back/subject/update.handler",
			            contentType: 'application/json',
			            dataType:"json",
			            data: JSON.stringify($("#form").serializeJSON()),
			            success: function (data) {
			                if (data.status = 'y') {
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
			    	if($("#select2").val() == 1){
			    		var name = $($("#answer21 option:selected")[0]).attr("name");
			    		$("#answer21").attr('name',name);
			    		$(".answer22").attr('disabled','true');
			    	}else{
			    		$("#answer21").attr('disabled','true');
			    	}
			        $.ajax({
			            type: 'post',
			            url: path+"/back/subject/add.handler",
			            contentType: 'application/json',
			            dataType:"json",
			            data: JSON.stringify($("#addform").serializeJSON()),
			            success: function (data) {
			                if (data.status = 'y') {
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
			/*选择框初始化 */
			$("#select2").append($(
				"<option value='1'>"+param[1]+"</option>"+
				"<option value='2'>"+param[2]+"</option>"
			))
			$("#select1").append($(
				"<option value='1'>"+param[1]+"</option>"+
				"<option value='2'>"+param[2]+"</option>"
			))
			$("#answer1").hide();
			$("#answer2").hide();
			$("#select2").change(function(){
				change('2');
			})
			$("#select1").change(function(){
				change('1');
			})
		})
		/* 异步上传事件*/
		function up(levelId){
			if($("#file").val() == ""){
				window.alert("请选择文件");
				return;
			}
			var form = new FormData();
			form.append('levelId',levelId);
			form.append('file',document.getElementById("file").files[0]);
			$.ajax({
				url:path+'/back/subject/upload.handler',				
				type:'post',
				data: form,
				contentType: false,
				processData: false,
				dataType:'json',
				success:function(data){
					if(data.status == 'y'){
						window.alert('上传成功');
						table.ajax.reload();
	                    table.draw(false);
					}else{
						window.alert("上传失败");
					}
				},
				error:function(){
					window.alert("上传失败");
				}
			})
			$("#upModal").modal('hide');
		}		
		/* 进入修改页面前 */
		function modify(id) {
			$.ajax({
				 url :path+"/back/subject/getById.handler",
			     async : true,
			     type : "POST",
			     data : {subjectId:id},
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
			$("#subjectId").val(data.subjectId);
			$("#subjectOptiona").val(data.subjectOptiona);
			$("#subjectOptionb").val(data.subjectOptionb);
			$("#subjectOptionc").val(data.subjectOptionc);
			$("#subjectOptiond").val(data.subjectOptiond);
			$("#subjectTitle").val(data.subjectTitle);
			$($("#levelId1 option[value='"+data.levelId+"']")[0]).attr('selected','true');
			$($("#select1 option[value='"+data.subjectState+"']")[0]).attr("selected",'true');
			if(data.subjectState == 2){
				$("#select1").change();
				check(data,"subjectOptionaScore");
				check(data,"subjectOptionbScore");
				check(data,"subjectOptioncScore");
				check(data,"subjectOptiondScore");
			}else{
				select(data,"subjectOptionaScore");
				select(data,"subjectOptionbScore");
				select(data,"subjectOptioncScore");
				select(data,"subjectOptiondScore");
			}
			$("#myModal").modal('show');
		}
		function check(data,str){
			if(data[str] != 0){
				$($("#answer1 input[name='"+str+"']")[0]).attr("checked",'true');
			}
		}
		function select(data,str){
			if(data[str] != 0){
				$($("#answer11 option[name='"+str+"']")[0]).attr("selected",'true');
			}
		}
		/* 删除 */
		function del(id){
			var flag = window.confirm("确定删除？");
			if(flag){
				$.ajax({
		            type: 'post',
		            url: path+"/back/subject/delete.handler",
		            data: {subjectId:id},
		            dataType:"json",
		            success: function (data) {
		                if (data.status == 'y') {
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
			clean('1',"#form");
		});
		$("#addModal").on('hidden.bs.modal', function () {
			clean('2',"#addform");
		});
		$("#upModal").on('hidden.bs.modal', function () {
			$("#upform").Validform().resetForm();
			$($("#levelId3 option")).removeAttr('selected');
		});
		/*清空*/
		function clean(type,form){
			$(form).Validform().resetForm();
			$(".Validform_checktip>.Validform_checktip").html("");
			$("#answer"+type+"").hide();
			$("#answer"+type+"1").show();
			$(".answer"+type+"2").removeAttr('disabled');
			$("#answer"+type+"1").removeAttr('disabled');
			$($("#select"+type+" option")).removeAttr("selected");
			$(".answer"+type+"2").removeAttr('checked');
			$($("#levelId"+type+" option")).removeAttr('selected');
		}
		/* 变化*/
		function change(type){
			$("#answer"+type+"1").toggle();
			$("#answer"+type).toggle();
		}