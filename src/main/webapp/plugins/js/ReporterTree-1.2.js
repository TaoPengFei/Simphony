var setting = { 
					view: { 
						dblClickExpand: false,
						selectedMulti: false,
						checkable : true 
					}, 
					data: { 
						simpleData: { 
							enable: true 
						} 
					}, 
					callback: { 
						//beforeClick: beforeClick, 
						onClick: onClick 
					},
					
				};  
				//获取CDA数据
				var jsonData = "";
				$.ajaxSetup({
					async : false	//同步，不异步
				});
				$.getJSON(
					"/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=AreaQueryForTree",
					function(result){
						jsonData = "[";
						//alert(result.resultset.length);
						$.each(
							result.resultset,
							function(i, row){
								var data = result.resultset;
								if( i < result.resultset.length-1 ){
									//jsonData += '{"id":"' + data[1][0] + '","text":"' + data[1][1] + '","parame":"area' +'"},';
									jsonData += '{"id":"'+ data[i][0]  + '","pId":"'+data[i][1] + '","name":"'+data[i][2] + '","open":"true' + '"},';
								}else if( i == data.length - 1 ){
									//jsonData += '{"id":"' + data[1][0] + '","text":"' + data[1][1] + '","parame":"area' +'"}';
									//jsonData += '{"id":"'+ data[i][0] + '","name":"'+data[i][1] + '","pId":"'+data[i][2]+'"},';
									jsonData += '{"id":"'+ data[i][0]  + '","pId":"'+data[i][1] + '","name":"'+data[i][2] + '","open":"true' + '"}';
								} 
							}
						)
						jsonData += "]";	//字符串拼接成功
						jsonData = eval('('+ jsonData +')');	//将字符串转换为json格式
						console.log(jsonData);
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
				
				function onClick(e, treeId, treeNode) { 
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
					hideMenu();
					
				} 
				
				//alert("bb = " + bb.x);
				function onBodyDown(event) { 
					if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) { 
						hideMenu(); 
					} 
				}
				//插件形式加载功能模块
				$(document).ready(function(){ 
					$.fn.zTree.init($("#treeDemo"), setting, jsonData); 
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					var node = treeObj.getNodeByParam("id", "0~1");
					treeObj.selectNode(node);
				});