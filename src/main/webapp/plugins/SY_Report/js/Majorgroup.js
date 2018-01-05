var setting_maj = {
					view: {
						dblClickExpand: false/*,
						selectedMulti: true,
						checkable : true*/
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
            onCheck:onCheck_maj
					},

				};
				//获取CDA数据
				var jsonData_maj = "";
				$.ajaxSetup({
					async : false	//同步，不异步
				});
				$.getJSON(
          // "/Simphony/ReportFilterParameter.do",
          "http://localhost:8080/Simphony/MajorgroupParameter.do",
					function(result){
						jsonData = "[";
						$.each(
							// result.resultset,
              result,
							function(i, row){
								// var data = result.resultset;
                var data = result;
								// if( i < result.resultset.length-1 ){
                if( i < data.length-1 ){
									// jsonData += '{"id":"'+ data[i][0]  + '","pId":"'+data[i][1] + '","name":"'+data[i][2] + '","open":"true' + '"},';
                  jsonData += '{"id":"'+ data[i].id  + '","pId":"'+ data[i].pid + '","name":"'+data[i].name + '","open":"true' + '"},';
								}else if( i == data.length - 1 ){
									// jsonData += '{"id":"'+ data[i][0]  + '","pId":"'+data[i][1] + '","name":"'+data[i][2] + '","open":"true' + '"}';
                  jsonData += '{"id":"'+ data[i].id  + '","pId":"'+ data[i].pid + '","name":"'+data[i].name + '","open":"true' + '"}';
								}
							}
						)
						jsonData += "]";	//字符串拼接成功
						jsonData = eval('('+ jsonData +')');	//将字符串转换为json格式
					}
				);

				/*  取消此事件
				function beforeClick(treeId, treeNode) {
					var check = (treeNode && !treeNode.isParent);
					if (!check){
						alert("只能选择城市...");
					}else{
						hideMenu();
					}
					return check;
				}
				*/
        /*function beforeClick(treeId, treeNode) {
          var zTree = $.fn.zTree.getZTreeObj("treeDemo");
          zTree.checkNode(treeNode, !treeNode.checked, null, true);
          return false;
        }*/

				//显示下拉菜单的树状结构
				function showMenu() {
					var cityObj = $("#citySel");
					var cityOffset = $("#citySel").offset();
					$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
					$("body").bind("mousedown", onBodyDown);
					//alert("click");
				}
				//隐藏下拉菜单的树状结构
				function hideMenu() {
					$("#menuContent").fadeOut("fast");
					$("body").unbind("mousedown", onBodyDown);
				}
				//树状结构的点击事件

				/*function onClick(e, treeId, treeNode) {
					var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
					nodes = zTree.getSelectedNodes(),
					v = "";
					var nodeId = "";
					nodeLevel = "";

					nodes.sort(function compare(a,b){
						return a.id-b.id;
					});
					for (var i=0, l=nodes.length; i<l; i++) {
						v += nodes[i].name + ",";
						nodeId += nodes[i].id + ",";
						nodeLevel += nodes[i].level + ",";
					}
					if (v.length > 0 )
						v = v.substring(0, v.length-1);
					var cityObj = $("#citySel");
					cityObj.attr("value", v);
					//bb = {x : nodeId};
					//alert(cityObj.value);
					//alert("内部：" + nodeId);
					//alert(bb.x);
					//alert("内部：" + nodeLevel);
					//hideMenu();

				}*/

        function onCheck(e, treeId, treeNode) {
          var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
            nodes = zTree.getCheckedNodes(true),
            v = "";
          var nodeId = "";
          nodeLevel = "";

          /*for (var i=0, l=nodes.length; i<l; i++) {
            v += nodes[i].name + ",";
          }
          if (v.length > 0 ) v = v.substring(0, v.length-1);
          var cityObj = $("#citySel");
          cityObj.attr("value", v);*/
          for (var i=0, l=nodes.length; i<l; i++) {
            v += nodes[i].name + ",";
            nodeId += nodes[i].id + ",";
            nodeLevel += nodes[i].level + ",";
          }
          if (v.length > 0 )
            v = v.substring(0, v.length-1);
          var cityObj = $("#citySel");
          cityObj.attr("value", v);
          console.log(nodeId);
        }

          //alert("bb = " + bb.x);
          function onBodyDown(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
              hideMenu();
            }
          }

          //插件形式加载功能模块
          $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting, jsonData);
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            var node = treeObj.getNodeByParam("id", "-1");
            //treeObj.selectNode(node);
            treeObj.checkNode(node, true, true);
          });

