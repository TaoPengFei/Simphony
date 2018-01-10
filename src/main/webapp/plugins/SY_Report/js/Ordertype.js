				var setting_ord = {
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
				        onCheck:onCheck_ord
					},
				};
				//获取CDA数据
				var jsonData_ord = "";
				$.ajaxSetup({
					async : false	//同步，不异步
				});
				$.getJSON(
					// "/Simphony/ReportFilterParameter.do",
					"http://localhost:8888/Simphony/OrdertypeParameter.do",
					function(result){
						jsonData_ord = "[";
						$.each(
							result,
							function(i, row){
                        	 	var data_ord = result;
				                if( i < data_ord.length-1 ){												
				                  jsonData_ord += '{"id":"'+ data_ord[i].id  + '","pId":"'+ data_ord[i].pid + '","name":"'+data_ord[i].name + '","open":"true' + '"},';
								}else if( i == data_ord.length - 1 ){													
								  jsonData_ord += '{"id":"'+ data_ord[i].id  + '","pId":"'+ data_ord[i].pid + '","name":"'+data_ord[i].name + '","open":"true' + '"}';
								}
							}
						)
						jsonData_ord += "]";	//字符串拼接成功
						jsonData_ord = eval('('+ jsonData_ord +')');	//将字符串转换为json格式
						console.log(jsonData_ord);
					}
				);
                

				//显示下拉菜单的树状结构
				function showMenu_ord() {
					var Obj_ord = $("#Sel_ord");
					var Offset_ord = $("#Sel_ord").offset();
					$("#menuContent_ord").css({left:Offset_ord.left + "px", top:Offset_ord.top + Obj_ord.outerHeight() + "px"}).slideDown("fast");
					$("body").bind("mousedown", onBodyDown_ord);
					//alert("click");
				}
				//隐藏下拉菜单的树状结构
				function hideMenu_ord() {
					$("#menuContent_ord").fadeOut("fast");
					$("body").unbind("mousedown", onBodyDown_ord);
				}

        function onCheck_ord(e, treeId, treeNode) {
          var zTree_ord = $.fn.zTree.getZTreeObj("treeDemo_ord"),
            nodes_ord = zTree_ord.getCheckedNodes(true),
            v_ord = "";
          var nodeId_ord = "";
          nodeLevel_ord = "";

          for (var i=0, l=nodes_ord.length; i<l; i++) {
        	  if(nodes_ord[i].isParent){
        		  v_ord = "";
        		  v_ord += nodes_ord[i].name + ",";
                  nodeId_ord += nodes_ord[i].id + ",";
                  nodeLevel_ord += nodes_ord[i].level + ",";
                  break;
        	  }else{
        		  v_ord += nodes_ord[i].name + ",";
                  nodeId_ord += nodes_ord[i].id + ",";
                  nodeLevel_ord += nodes_ord[i].level + ",";
        	  }
            
          }
          if (v_ord.length > 0 )
            v_ord = v_ord.substring(0, v_ord.length-1);
          var Obj_ord = $("#Sel_ord");
          Obj_ord.attr("value", v_ord);
          console.log(nodeId_ord);
        }

          //alert("bb = " + bb.x);
          function onBodyDown_ord(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent_ord" || $(event.target).parents("#menuContent_ord").length > 0)) {
              hideMenu_ord();
            }
          }

        //插件形式加载功能模块
          $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo_ord"), setting_ord, jsonData_ord);
            var Obj_ord = $.fn.zTree.getZTreeObj("treeDemo_ord");  
            var node_ord = Obj_ord.getNodeByParam("id", "-1");
            //Obj_ord.selectNode(node_ord);
            Obj_ord.checkNode(node_ord, true, true);
          });

