<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Historical Receipt Search Detail</title>
	<link href="plugins/SY_Report/daterangepicker/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" media="all" href="plugins/SY_Report/daterangepicker/daterangepicker-bs3.css" />
	<link rel="stylesheet" type="text/css" media="all" href="plugins/SY_Report/daterangepicker/daterangepicker-1.3.7.css" />
	<link href="plugins/SY_Report/daterangepicker/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet">

	<script type="text/javascript" src="plugins/jQuery/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="plugins/SY_Report/daterangepicker/bootstrap.min.js"></script>
	<script type="text/javascript" src="plugins/SY_Report/daterangepicker/moment.js"></script>
	<script type="text/javascript" src="plugins/SY_Report/daterangepicker/daterangepicker-1.3.7.js"></script>

	<!-- ztree -->
	<link rel="stylesheet" href="plugins/SY_Report/ztree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="plugins/SY_Report/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">

	<!-- custom css-->
	<link rel="stylesheet" href="plugins/SY_Report/css/ReporterVersion-1.2.css" type="text/css">

	<script type="text/javascript" src="plugins/SY_Report/ztree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="plugins/SY_Report/ztree/js/jquery.ztree.excheck.js"></script>

	<!-- <script type="text/javascript" src="plugins/SY_Report/js/Revenuecenter.js"></script>
    <script type="text/javascript" src="plugins/SY_Report/js/Ordertype.js"></script>
    <script type="text/javascript" src="plugins/SY_Report/js/Tendermedia.js"></script>
    <script type="text/javascript" src="plugins/SY_Report/js/Discount.js"></script>
    <script type="text/javascript" src="plugins/SY_Report/js/Employee.js"></script> -->


	<script type="text/javascript">
        if( navigator.browserLanguage != "undefined" && navigator.browserLanguage != null ){
            document.write("<script src='plugins/SY_Report/daterangepicker/location/daterangepicker-zh_CN.js'><\/script>");
        }else if( navigator.language == "zh-CN" || navigator.systemLanguage == "zh" ){
//			document.write("<script src='plugins/SY_Report/daterangepicker/location/daterangepicker-zh_CN.js'><\/script>");
            document.write("<script src='plugins/SY_Report/daterangepicker/location/daterangepicker-zh_CN.js'><\/script>");
        }else if( navigator.language == "en-US" || navigator.systemLanguage == "en" ){
            document.write("<script src='plugins/SY_Report/daterangepicker/location/daterangepicker-zh_CN.js'><\/script>");
        }
	</script>

</head>

<body class="bg" >
<div class="reportHeader" style="margin-left:0px;margin-top: 5px;">
	<ul class="nav nav-tabs">
		<!-- Date  -->
		<!-- <li>
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row-fluid" style="margin-top:0px">
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label filter-text">
                                    营业日
                                </label>
                            <div class="controls">
                                <div id="reportrange" class="pull-left dateRange" style="font-size:11px;width:200px">
                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                    <span id="searchDateRange"></span>
                                    <b class="caret"></b>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
        </li> -->

		<!-- Revenuecenter  -->
		<!-- <li>
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row-fluid" style="margin-top:0px">
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label filter-text">
                                    营业点
                                </label>
                            <div class="controls">
                                <input id="rctSel" type="text" readonly value="" style="width:190px;line-height: 30px;background-color: #fff;" onclick="showrctMenu(); return false;"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
        </li> -->

		<!-- Ordertype  -->
		<!-- <li>
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row-fluid" style="margin-top:0px">
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label filter-text">
                                    销售类型
                                </label>
                            <div class="controls">
                                <input id="Sel_ord" type="text" readonly value="" style="width:190px;line-height: 30px;background-color: #fff;" onclick="showMenu_ord(); return false;"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
        </li> -->

		<!-- 金额  -->
		<!-- <li>
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row-fluid" style="margin-top:0px">
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label filter-text">
                                    金额
                                </label>
                            <div class="controls">
                                <input id="amount" type="text"  value="999999999" style="width:190px;line-height: 30px;background-color: #fff;"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
        </li> -->

		<!-- SKU码 -->
		<!-- <li>
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row-fluid" style="margin-top:0px">
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label filter-text">
                                    SKU码
                                </label>
                            <div class="controls">
                                <input id="barCode" type="text"  value="-1" style="width:190px;line-height: 30px;background-color: #fff;"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
        </li> -->

		<!--Discount -->
		<!-- <li>
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row-fluid" style="margin-top:0px">
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label filter-text">
                                    折扣类型
                                </label>
                            <div class="controls">
                                <input id="Sel_dis" type="text" readonly value="" style="width:190px;line-height: 30px;background-color: #fff;" onclick="showMenu_dis(); return false;"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
        </li> -->

		<!--Employee -->
		<!-- <li>
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row-fluid" style="margin-top:0px">
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label filter-text">
                                    收银员
                                </label>
                            <div class="controls">
                                <input id="Sel_emp" type="text" readonly value="" style="width:190px;line-height: 30px;background-color: #fff;"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
        </li> -->


		<!-- Output Type  -->
		<li>
			<div class="page-content">
				<div class="container-fluid">
					<div class="row-fluid" style="margin-top:0px">
						<div class="span4">
							<div class="control-group">
								<label class="control-label filter-text">
									输出类型
								</label>
								<div class="controls">
									<select  id="outputType" name="outputType" style="width:190px;height:32px;margin-bottom:5px;" >
										<option value="html">HTML</option>
										<option value='pdf'>PDF</option>
										<option value='excel2003'>Excel2003</option>
										<option value='excel2007'>Excel2007</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>

		<!-- Search Button  -->
		<li>
			<div class="page-content">
				<!-- BEGIN PAGE CONTAINER-->
				<div class="container-fluid">
					<div class="row-fluid" style="margin-top:0px">
						<div class="span4">
							<div class="control-group">
								<label class="control-label filter-text" style="width: 120px;color: #fff">
									*
								</label>
								<div class="controls">
									<span id="Btn_" style="text-align:left;margin-bottom: 5px;width:80px;height:32px;" >
										<button id="btn" class="" style="margin-left:5px;width:80px;height:32px;font-size:11px"
												parame="" onmouseover="this.style.background='#5985b6'"
												onmouseout="this.style.background=''">查询
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>
	</ul>

</div>
<div id="menurctContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemorct" class="ztree" style="margin-top:0; width:300px;"></ul>
</div>
<div id="menuContent_ord" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemo_ord" class="ztree" style="margin-top:0; width:300px;"></ul>
</div>
<div id="menuContent_ted" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemo_ted" class="ztree" style="margin-top:0; width:300px;"></ul>
</div>
<div id="menuContent_dis" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemo_dis" class="ztree" style="margin-top:0; width:300px;"></ul>
</div>
<div id="menuContent_emp" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemo_emp" class="ztree" style="margin-top:0; width:300px;"></ul>
</div>
<!-- 报表展示区域  -->
<iframe id="report" width="100%"   title="报表预览" frameborder=no style="width:100%;height:800px;padding:0px 0px;"  ></iframe>
</body>
<script type="text/javascript">

    var ReportWeb = (function($){
        var getValue = function(){
            //获取CDA元素
            var readJSONFile = function(url){
                var jsonData;
                $.ajax({
                    type : 'GET',
                    url : url,
                    async : false,
                    dataType : 'json',
                    data : null,
                    success : function(response){
                        jsonData = response;
                        //alert(jsonData);
                    }
                })
                return jsonData;
            };
            /*************************************************
             *                   事件函数                    *
             *************************************************/
            var bindEvents = function(){
                $("#btn").bind("click",function( e, treeId, treeNode ){
                    /**
                     *  	营业点
                     **/
                    /* var zTreerct = $.fn.zTree.getZTreeObj("treeDemorct"),
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
                    rctObj.attr("value", vrct); */
                    //alert(nodeIdrct);

                    /**
                     *  	销售类型
                     **/
                    /* var zTree_ord = $.fn.zTree.getZTreeObj("treeDemo_ord"),
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
                    Obj_ord.attr("value", v_ord); */
                    //alert(nodeId_ord);

                    /**
                     *  	支付方式
                     **/
                    /* var zTree_ted = $.fn.zTree.getZTreeObj("treeDemo_ted"),
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
                        }else{
                            v_ted += nodes_ted[i].name + ",";
                              nodeId_ted += nodes_ted[i].id + ",";
                              nodeLevel_ted += nodes_ted[i].level + ",";
                        }
                    }
                    if (v_ted.length > 0 )
                      v_ted = v_ted.substring(0, v_ted.length-1);
                    var Obj_ted = $("#Sel_ted");
                    Obj_ted.attr("value", v_ted); */
                    //alert(nodeId_ord);

                    /**
                     *  	折扣类型
                     **/
                    /* var zTree_dis = $.fn.zTree.getZTreeObj("treeDemo_dis"),
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
                        }else{
                            v_dis += nodes_dis[i].name + ",";
                              nodeId_dis += nodes_dis[i].id + ",";
                              nodeLevel_dis += nodes_dis[i].level + ",";
                        }
                    }
                    if (v_dis.length > 0 )
                      v_dis = v_dis.substring(0, v_dis.length-1);
                    var Obj_dis = $("#Sel_dis");
                    Obj_dis.attr("value", v_dis); */

                    /**
                     *  	收银员
                     **/
                    /* var zTree_emp = $.fn.zTree.getZTreeObj("treeDemo_emp"),
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
                        }else{
                            v_emp += nodes_emp[i].name + ",";
                              nodeId_emp += nodes_emp[i].id + ",";
                              nodeLevel_emp += nodes_emp[i].level + ",";
                        }
                    }
                    if (v_emp.length > 0 )
                      v_emp = v_emp.substring(0, v_emp.length-1);
                    var Obj_emp = $("#Sel_emp");
                    Obj_emp.attr("value", v_emp); */

                    /**
                     *  	金额
                     **/
                    //var amount = document.getElementById("amount").value;
                    /**
                     *  SKU码
                     **/
                    //var barCode = document.getElementById("barCode").value;

                    function GetQueryString(name)
                    {
                        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                        var r = window.location.search.substr(1).match(reg);
                        if(r!=null)return  unescape(r[2]); return null;
                    }

                    var StartDays = new Date(GetQueryString("StartDay"));
                    var StartDay = StartDays.getFullYear() + '-' + (StartDays.getMonth() + 1) + '-' + StartDays.getDate();
                    //alert(StartDay);
                    var EndDays = new Date(GetQueryString("EndDay"));
                    var EndDay = EndDays.getFullYear() + '-' + (EndDays.getMonth() + 1) + '-' + EndDays.getDate();
                    //alert(EndDay);
                    var revenuecenterid = GetQueryString("revenuecenterid");
                    var ordertypeid = GetQueryString("ordertypeid");
                    var amount = GetQueryString("amount");
                    var barCode = GetQueryString("barCode");
                    var tendermediareportid = GetQueryString("tendermediareportid");
                    var discountreportid = GetQueryString("discountreportid");
                    var employeeid = GetQueryString("employeeid");

                    var url_param="";

                    url_param = url_param + "&EndDay="+ EndDay + "&StartDay="+ StartDay +"&revenuecenterid="+ revenuecenterid +"&ordertypeid="+ ordertypeid +"&tendermediareportid="+ tendermediareportid+"&discountreportid="+ discountreportid+"&employeeid="+ employeeid+"&amount="+ amount +"&barCode="+barCode;
                    /*开始日期*/	/*用正则表达式去截取开始日期*/
                    /* var StartDayParam = $('#reportrange span').text().match(/(\S*)~/)[1];
                    if( StartDayParam!="" && StartDayParam!=undefined ) url_param = url_param + "&StartDay=" + StartDayParam; */
                    /*结束日期*/	/*用正则表达式去截取结束日期 */
                    /* var EndDayParam = $('#reportrange span').text().match(/~(\S*)/)[1];
                    if( EndDayParam!="" && EndDayParam!=undefined )  url_param = url_param + "&EndDay=" + EndDayParam; */
                    /*输出类型*/
                    var OutPutParam = $("#outputType").val();
                    if(OutPutParam!="" && OutPutParam!=undefined)	url_param = url_param + "&outputType=" + OutPutParam;

                    //alert( url_param );
                    var page = 0;
                    /*****************************************************
                     *                          报表的url                 *
                     *****************************************************/
                    var url = "http://localhost:8888/Simphony/HistoricalDetail?" + url_param;
                    //alert(url);
                    $("#report").attr("src", url);
                });
            }();
        }();
    })(jQuery);
</script>
</html>
