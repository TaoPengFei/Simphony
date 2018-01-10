				var setting_ted = {
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
				        onCheck:onCheck_ted
					},
				};
				//获取CDA数据
				var jsonData_ted = "";
				$.ajaxSetup({
					async : false	//同步，不异步
				});
				$.getJSON(
					// "/Simphony/ReportFilterParameter.do",
					"http://localhost:8888/Simphony/TendermediaParameter.do",
					function(result){
						jsonData_ted = "[";
						$.each(
							result,
							function(i, row){
                        	 	var data_ted = result;
				                if( i < data_ted.length-1 ){												
				                  jsonData_ted += '{"id":"'+ data_ted[i].id  + '","pId":"'+ data_ted[i].pid + '","name":"'+data_ted[i].name + '","open":"true' + '"},';
								}else if( i == data_ted.length - 1 ){													
									jsonData_ted += '{"id":"'+ data_ted[i].id  + '","pId":"'+ data_ted[i].pid + '","name":"'+data_ted[i].name + '","open":"true' + '"}';
								}
							}
						)
						jsonData_ted += "]";	//字符串拼接成功
						jsonData_ted = eval('('+ jsonData_ted +')');	//将字符串转换为json格式
						console.log(jsonData_ted);
					}
				);
                

				//显示下拉菜单的树状结构
				function showMenu_ted() {
					var Obj_ted = $("#Sel_ted");
					var Offset_ted = $("#Sel_ted").offset();
					$("#menuContent_ted").css({left:Offset_ted.left + "px", top:Offset_ted.top + Obj_ted.outerHeight() + "px"}).slideDown("fast");
					$("body").bind("mousedown", onBodyDown_ted);
					//alert("click");
				}
				//隐藏下拉菜单的树状结构
				function hideMenu_ted() {
					$("#menuContent_ted").fadeOut("fast");
					$("body").unbind("mousedown", onBodyDown_ted);
				}

        function onCheck_ted(e, treeId, treeNode) {
          var zTree_ted = $.fn.zTree.getZTreeObj("treeDemo_ted"),
            nodes_ted = zTree_ted.getCheckedNodes(true),
            v_ted = "";
          var nodeId_ted = "";
          nodeLevel_ted = "";

          for (var i=0, l=nodes_ted.length; i<l; i++) {
        	  if(nodes_ted[i].isParent){
        		  v_ted = "";
        		  v_ted += nodes_ted[i].name + ",";
                  nodeId_ted += nodes_ted[i].id + ",";
                  nodeLevel_ted += nodes_ted[i].level + ",";
                  break;
        	  } else{
        		  v_ted += nodes_ted[i].name + ",";
                  nodeId_ted += nodes_ted[i].id + ",";
                  nodeLevel_ted += nodes_ted[i].level + ",";
        	  }        
          }
          if (v_ted.length > 0 )
            v_ted = v_ted.substring(0, v_ted.length-1);
          var Obj_ted = $("#Sel_ted");
          Obj_ted.attr("value", v_ted);
          console.log(nodeId_ted);
        }

          //alert("bb = " + bb.x);
          function onBodyDown_ted(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent_ted" || $(event.target).parents("#menuContent_ted").length > 0)) {
              hideMenu_ted();
            }
          }

        //插件形式加载功能模块
          $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo_ted"), setting_ted, jsonData_ted);
            var Obj_ted = $.fn.zTree.getZTreeObj("treeDemo_ted");  
            var node_ted = Obj_ted.getNodeByParam("id", "-1");
            //Obj_ted.selectNode(node_ted);
            Obj_ted.checkNode(node_ted, true, true);
          });

