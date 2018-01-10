				var setting_emp = {
					view: {
						dblClickExpand: false
					},
					check: {
				        enable: true,
				        chkboxType: {"Y":"s", "N":"ps"},
				        autoCheckTrigger: true
				      },
					  data: {
									simpleData: {
										enable: true
									}
								},
						callback: {
							// beforeClick: beforeClick,
							// onClick: onClick,
				        onCheck:onCheck_emp
					},
				};
				//获取CDA数据
				var jsonData_emp = "";
				$.ajaxSetup({
					async : false	//同步，不异步
				});
				$.getJSON(
					
					"http://localhost:8888/Simphony/EmployeeParameter.do",
					function(result){
						jsonData_emp = "[";
						$.each(
							result,
							function(i, row){
                        	 	var data_emp = result;
				                if( i < data_emp.length-1 ){												
				                  jsonData_emp += '{"id":"'+ data_emp[i].id  + '","pId":"'+ data_emp[i].pid + '","name":"'+data_emp[i].name + '","open":"true' + '"},';
								}else if( i == data_emp.length - 1 ){													
									jsonData_emp += '{"id":"'+ data_emp[i].id  + '","pId":"'+ data_emp[i].pid + '","name":"'+data_emp[i].name + '","open":"true' + '"}';
								}
							}
						)
						jsonData_emp += "]";	//字符串拼接成功
						jsonData_emp = eval('('+ jsonData_emp +')');	//将字符串转换为json格式
						console.log(jsonData_emp);
					}
				);
                

				//显示下拉菜单的树状结构
				function showMenu_emp() {
					var Obj_emp = $("#Sel_emp");
					var Offset_emp = $("#Sel_emp").offset();
					$("#menuContent_emp").css({left:Offset_emp.left + "px", top:Offset_emp.top + Obj_emp.outerHeight() + "px"}).slideDown("fast");
					$("body").bind("mousedown", onBodyDown_emp);
					//alert("click");
				}
				//隐藏下拉菜单的树状结构
				function hideMenu_emp() {
					$("#menuContent_emp").fadeOut("fast");
					$("body").unbind("mousedown", onBodyDown_emp);
				}

        function onCheck_emp(e, treeId, treeNode) {
          var zTree_emp = $.fn.zTree.getZTreeObj("treeDemo_emp"),
            nodes_emp = zTree_emp.getCheckedNodes(true),
            v_emp = "";
          var nodeId_emp = "";
          nodeLevel_emp = "";

          for (var i=0, l=nodes_emp.length; i<l; i++) {
        	  if(nodes_emp[i].isParent){
        		  v_emp = "";
        		  v_emp += nodes_emp[i].name + ",";
                  nodeId_emp += nodes_emp[i].id + ",";
                  nodeLevel_emp += nodes_emp[i].level + ",";
                  break;
        	  } else{
        		  v_emp += nodes_emp[i].name + ",";
                  nodeId_emp += nodes_emp[i].id + ",";
                  nodeLevel_emp += nodes_emp[i].level + ",";
        	  }        
          }
          if (v_emp.length > 0 )
            v_emp = v_emp.substring(0, v_emp.length-1);
          var Obj_emp = $("#Sel_emp");
          Obj_emp.attr("value", v_emp);
          console.log(nodeId_emp);
        }

          //alert("bb = " + bb.x);
          function onBodyDown_emp(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent_emp" || $(event.target).parents("#menuContent_emp").length > 0)) {
              hideMenu_emp();
            }
          }

        //插件形式加载功能模块
          $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo_emp"), setting_emp, jsonData_emp);
            var Obj_emp = $.fn.zTree.getZTreeObj("treeDemo_emp");  
            var node_emp = Obj_emp.getNodeByParam("id", "-1");
            //Obj_emp.selectNode(node_emp);
            Obj_emp.checkNode(node_emp, true, true);
          });

