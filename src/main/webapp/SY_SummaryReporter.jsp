<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Summary Reporter</title>
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
	<%--<link rel="stylesheet" href="plugins/SY_Report/ztree/css/metroStyle/metroStyle.css" type="text/css">--%>

	<!-- custom css-->
	<link rel="stylesheet" href="plugins/SY_Report/css/ReporterVersion-1.2.css" type="text/css">

	<script type="text/javascript" src="plugins/SY_Report/ztree/js/jquery.ztree.core.js"></script>
  <script type="text/javascript" src="plugins/SY_Report/ztree/js/jquery.ztree.excheck.js"></script>

	<script type="text/javascript" src="plugins/SY_Report/js/ReporterTree-1.2.js"></script>

	<script type="text/javascript">
		if( navigator.browserLanguage != "undefined" && navigator.browserLanguage != null ){
			document.write("<script src='plugins/SY_Report/daterangepicker/location/daterangepicker-en.js'><\/script>");
		}else if( navigator.language == "zh-CN" || navigator.systemLanguage == "zh" ){
//			document.write("<script src='plugins/SY_Report/daterangepicker/location/daterangepicker-zh_CN.js'><\/script>");
      document.write("<script src='plugins/SY_Report/daterangepicker/location/daterangepicker-en.js'><\/script>");
		}else if( navigator.language == "en-US" || navigator.systemLanguage == "en" ){
			document.write("<script src='plugins/SY_Report/daterangepicker/location/daterangepicker-en.js'><\/script>");
		}
	</script>

</head>

<body class="bg" >
	<div class="reportHeader" style="margin-left:0px;margin-top: 5px;">
		<ul class="nav nav-tabs">
			<!-- Date  -->
			<li>
				<div class="page-content">
					<div class="container-fluid">
						<div class="row-fluid" style="margin-top:0px">
							<div class="span4">
								<div class="control-group">
									<label class="control-label filter-text">
										Date
									</label>
								<div class="controls">
									<div id="reportrange" class="pull-left dateRange" style="font-size:11px;width:190px">
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
			</li>

			<!-- Location  -->
			<li>
				<div class="page-content">
					<div class="container-fluid">
						<div class="row-fluid" style="margin-top:0px">
							<div class="span4">
								<div class="control-group">
									<label class="control-label filter-text">
										Location
									</label>
								<div class="controls">
									<input id="citySel" type="text" readonly value="All" style="width:170px;line-height: 30px;background-color: #fff;" onclick="showMenu(); return false;"/>
								</div>
							</div>
						</div>
					</div>
				</div>
          </div>
			</li>

			<!-- Brand  -->
			<li>
				<div class="page-content">
					<div class="container-fluid">
						<div class="row-fluid" style="margin-top:0px">
							<div class="span4">
								<div class="control-group">
									<label class="control-label filter-text">
										Brand
									</label>
								<div class="controls">
									<select id="Brand" class="" style="width:190px;height:32px;margin-bottom:5px;"  >
                    <option value="-1">ALL</option>
                  </select>
								</div>
							</div>
						</div>
					</div>
				</div>
          </div>
			</li>

			<!-- Output Type  -->
			<li>
				<div class="page-content">
					<div class="container-fluid">
						<div class="row-fluid" style="margin-top:0px">
							<div class="span4">
								<div class="control-group">
									<label class="control-label filter-text">
										Output Type
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
														onmouseout="this.style.background=''">Search
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
		<!--
		<ul>
			<li style="text-align:right;width:175px;" >
				<span id="Btn" style="text-align:left;margin-bottom: 5px;width:80px;height:22px;" >
					<button id="btn" class="" style="margin-left:5px;width:80px;height:25px;font-size:11px" parame="" onmouseover="this.style.background='#5985b6'" onmouseout="this.style.background=''"></button>
				</span>
			</li>
		 </ul>

			<ul class="list">

				<li class="title"> <span class="highlight_red">按下Ctrl或Cmd键可以进行多选</span></li>

				<li class="title">大区选择
					<input id="citySel" type="text" readonly value="--- 请选择 ---" style="width:350px;" onclick="showMenu(); return false;"/>
				</li>
			</ul>
			-->

	</div>
	<!-- -->
	<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top:0; width:300px;"></ul>
	</div>
	<!-- 报表展示区域  -->
	<iframe id="report" width="100%"   title="报表预览" frameborder=no style="width:100%;height:800px;padding:0px 0px;"  ></iframe>
	<%--<script type="text/javascript" src="/pentaho/BI/i18n/js/report.internationalization.js"></script>--%>
	</body>
	<%--<script type="text/javascript" src="/pentaho/js/sy_resizeIframe.js"></script>--%>
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
            var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
              nodes = zTree.getCheckedNodes(true),
              v = "";
            var nodeId = "";
            nodeLevel = "";
            for (var i=0, l=nodes.length; i<l; i++) {
              v += nodes[i].name + ",";
              nodeId += nodes[i].id + ",";
              nodeLevel += nodes[i].level + ",";
            }
            if (v.length > 0 )
              v = v.substring(0, v.length-1);
            var cityObj = $("#citySel");
            cityObj.attr("value", v);
            alert(nodeId);


            /*var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
              nodes = zTree.getCheckedNodes(true),
              v = "";
            var nodeId = "";
            nodeLevel = "";
            for (var i=0, l=nodes.length; i<l; i++) {
              v += nodes[i].name + ",";
              nodeId += nodes[i].id + ",";
              nodeLevel += nodes[i].level + ",";
            }
            if (v.length > 0 )
              v = v.substring(0, v.length-1);
            var cityObj = $("#citySel");
            cityObj.attr("value", v);
            alert(nodeId);*/



						var url_param="";

            url_param = url_param + "&aaa=" + nodeId.substr(0, nodeId.length - 1);
						/*开始日期*/	<!-- 用正则表达式去截取开始日期  -->
						var StartDayParam = $('#reportrange span').text().match(/(\S*)~/)[1];
						if( StartDayParam!="" && StartDayParam!=undefined ) url_param = url_param + "&StartDay=" + StartDayParam;
						/*结束日期*/	<!-- 用正则表达式去截取结束日期  -->
						var EndDayParam = $('#reportrange span').text().match(/~(\S*)/)[1];
						if( EndDayParam!="" && EndDayParam!=undefined )  url_param = url_param + "&EndDay=" + EndDayParam;
						/*品牌*/
						var BrandParam = $("#Brand option:selected").val();		//取ID
						if(BrandParam!=-1 && BrandParam!=undefined){
							url_param=url_param+"&BrandSelect=" + BrandParam;
						}
						/*输出类型*/
						var OutPutParam = $("#outputType").val();
						if(OutPutParam!="" && OutPutParam!=undefined)	url_param = url_param + "&outputType=" + OutPutParam;

						alert( url_param );
						var page = 0;
						/*****************************************************
						*                          报表的url                 *
						*****************************************************/
						/*var url="/pentaho/api/repos/%3Apublic%3Areport%3ASummaryReporter%3ASY_SummaryReport.prpt/viewer?" +
						"accepted-page=0" +
						"&paginate=false" +
						"&showParameters=false" +
						"&renderMode=REPORT" +
						"&htmlProportionalWidth=false" +
						"&webuser=admin" + url_param;*/
            var url = "http://localhost:8080/Simphony/Sample?" + url_param;
						$("#report").attr("src", url);
					});
				}();
			}();
		})(jQuery);
	</script>
	<%--<script type="text/javascript" src="/pentaho/js/sy_report_select.js"></script>--%>
</html>
