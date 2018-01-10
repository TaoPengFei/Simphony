				var setting_dis = {
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
				        onCheck:onCheck_dis
					},
				};
				//获取CDA数据
				var jsonData_dis = "";
				$.ajaxSetup({
					async : false	//同步，不异步
				});
				$.getJSON(
					
					"http://localhost:8888/Simphony/DiscountParameter.do",
					function(result){
						jsonData_dis = "[";
						$.each(
							result,
							function(i, row){
                        	 	var data_dis = result;
				                if( i < data_dis.length-1 ){												
				                  jsonData_dis += '{"id":"'+ data_dis[i].id  + '","pId":"'+ data_dis[i].pid + '","name":"'+data_dis[i].name + '","open":"true' + '"},';
								}else if( i == data_dis.length - 1 ){													
									jsonData_dis += '{"id":"'+ data_dis[i].id  + '","pId":"'+ data_dis[i].pid + '","name":"'+data_dis[i].name + '","open":"true' + '"}';
								}
							}
						)
						jsonData_dis += "]";	//字符串拼接成功
						jsonData_dis = eval('('+ jsonData_dis +')');	//将字符串转换为json格式
						console.log(jsonData_dis);
					}
				);
                

				//显示下拉菜单的树状结构
				function showMenu_dis() {
					var Obj_dis = $("#Sel_dis");
					var Offset_dis = $("#Sel_dis").offset();
					$("#menuContent_dis").css({left:Offset_dis.left + "px", top:Offset_dis.top + Obj_dis.outerHeight() + "px"}).slideDown("fast");
					$("body").bind("mousedown", onBodyDown_dis);
					//alert("click");
				}
				//隐藏下拉菜单的树状结构
				function hideMenu_dis() {
					$("#menuContent_dis").fadeOut("fast");
					$("body").unbind("mousedown", onBodyDown_dis);
				}

        function onCheck_dis(e, treeId, treeNode) {
          var zTree_dis = $.fn.zTree.getZTreeObj("treeDemo_dis"),
            nodes_dis = zTree_dis.getCheckedNodes(true),
            v_dis = "";
          var nodeId_dis = "";
          nodeLevel_dis = "";

          for (var i=0, l=nodes_dis.length; i<l; i++) {
        	  if(nodes_dis[i].isParent){
        		  v_dis = "";
        		  v_dis += nodes_dis[i].name + ",";
                  nodeId_dis += nodes_dis[i].id + ",";
                  nodeLevel_dis += nodes_dis[i].level + ",";
                  break;
        	  } else{
        		  v_dis += nodes_dis[i].name + ",";
                  nodeId_dis += nodes_dis[i].id + ",";
                  nodeLevel_dis += nodes_dis[i].level + ",";
        	  }        
          }
          if (v_dis.length > 0 )
            v_dis = v_dis.substring(0, v_dis.length-1);
          var Obj_dis = $("#Sel_dis");
          Obj_dis.attr("value", v_dis);
          console.log(nodeId_dis);
        }

          //alert("bb = " + bb.x);
          function onBodyDown_dis(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent_dis" || $(event.target).parents("#menuContent_dis").length > 0)) {
              hideMenu_dis();
            }
          }

        //插件形式加载功能模块
          $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo_dis"), setting_dis, jsonData_dis);
            var Obj_dis = $.fn.zTree.getZTreeObj("treeDemo_dis");  
            var node_dis = Obj_dis.getNodeByParam("id", "-1");
            //Obj_dis.selectNode(node_dis);
            Obj_dis.checkNode(node_dis, true, true);
          });

