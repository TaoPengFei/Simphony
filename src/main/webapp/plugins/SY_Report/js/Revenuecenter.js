var settingrct = {

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
		  onCheck:onCheckrct
	  },

};
		//获取CDA数据
		var jsonDatarct = "";
		$.ajaxSetup({
			async : false	//同步，不异步
		});

		$.getJSON(
        // "/Simphony/ReportFilterParameter.do",
        "http://localhost:8888/Simphony/RevenuecenterParameter.do",
			function(result){
        console.log(result);
				jsonDatarct = "[";
				$.each(
          result,
					function(i, row){
            var datarct = result;
						// if( i < result.resultset.length-1 ){
        if( i < datarct.length-1 ){
							// jsonData += '{"id":"'+ data[i][0]  + '","pId":"'+data[i][1] + '","name":"'+data[i][2] + '","open":"true' + '"},';
          jsonDatarct += '{"id":"'+ datarct[i].id  + '","pId":"'+ datarct[i].pid + '","name":"'+datarct[i].name + '","open":"true' + '"},';
						}else if( i == datarct.length - 1 ){
							// jsonData += '{"id":"'+ data[i][0]  + '","pId":"'+data[i][1] + '","name":"'+data[i][2] + '","open":"true' + '"}';
          jsonDatarct += '{"id":"'+ datarct[i].id  + '","pId":"'+ datarct[i].pid + '","name":"'+datarct[i].name + '","open":"true' + '"}';
						}
					}
				)
				jsonDatarct += "]";	//字符串拼接成功
				jsonDatarct = eval('('+ jsonDatarct +')');	//将字符串转换为json格式

			}
		);



		//显示下拉菜单的树状结构
		function showrctMenu() {
			var rctObj = $("#rctSel");
			var rctOffset = $("#rctSel").offset();
			$("#menurctContent").css({left:rctOffset.left + "px", top:rctOffset.top + rctObj.outerHeight() + "px"}).slideDown("fast");
			$("body").bind("mousedown", onBodyDownrct);
			//alert("click");
		}
		//隐藏下拉菜单的树状结构
		function hiderctMenu() {
			$("#menurctContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDownrct);
		}
		//树状结构的点击事件



		function onCheckrct(e, treeId, treeNode) {
		  var zTreerct = $.fn.zTree.getZTreeObj("treeDemorct"),
		    nodesrct = zTreerct.getCheckedNodes(true),
		    vrct = "";
		  var nodeIdrct = "";
		  nodeLevelrct = "";
		  for (var i=0, l=nodesrct.length; i<l; i++) {
			  if( nodesrct[i].isParent ){
		          vrct = "";
		          vrct += nodesrct[i].name + ",";
		          nodeIdrct += nodesrct[i].id + ",";
		          nodeLevelrct += nodesrct[i].level + ",";
		          break;
		         } else  {
		          vrct += nodesrct[i].name + ",";
		          nodeIdrct += nodesrct[i].id + ",";
		          nodeLevelrct += nodesrct[i].level + ",";
		        }

		  }
		  if (vrct.length > 0 )
		    vrct = vrct.substring(0, vrct.length-1);
		  var rctObj = $("#rctSel");
		  rctObj.attr("value", vrct);
		  console.log(nodeIdrct);

      /*var cNodes = treeNode.children;
      if(treeNode.checked){
        for(var i in cNodes) {
          cNodes[i].chkDisabled = true;
          zTreerct.updateNode(cNodes[i])
        }
      }else{
        for(var i in cNodes) {
          cNodes[i].chkDisabled = false;
          zTreerct.updateNode(cNodes[i])
        }
      }*/
		}

  //alert("bb = " + bb.x);
  function onBodyDownrct(event) { //
    if (!(event.target.id == "menuBtn" || event.target.id == "menurctContent" || $(event.target).parents("#menurctContent").length > 0)) {
    	hiderctMenu();
    }
  }

  //插件形式加载功能模块
  $(document).ready(function () {
    $.fn.zTree.init($("#treeDemorct"), settingrct, jsonDatarct);
    var rctObj = $.fn.zTree.getZTreeObj("treeDemorct");
    var noderct = rctObj.getNodeByParam("id", "-1");
    // rctObj.selectNode(noderct);
    rctObj.checkNode(noderct, true, true);
  });

