<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Reporter</title>
  <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
  <link href="plugins/daterangepicker/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" media="all" href="plugins/daterangepicker/daterangepicker-bs3.css" />
  <link rel="stylesheet" type="text/css" media="all" href="plugins/daterangepicker/daterangepicker-1.3.7.css" />
  <link href="plugins/daterangepicker/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet">
  <!-- <link rel="stylesheet" type="text/css" media="all" href="daterangepicker.css" />-->

  <!-- Include the plugin's CSS and JS: -->
  <%--<script type="text/javascript" src="plugins/js/bootstrap-multiselect.js"></script>
  <link rel="stylesheet" href="plugins/css/bootstrap-multiselect.css" type="text/css"/>--%>
  <link rel="stylesheet" type="text/css" href="plugins/css/bootstrap-select.css">
  <script type="text/javascript" src="plugins/jsbootstrap-select.js"></script>
  <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

  <!--
  <script type="text/javascript" src="/pentaho/SY_Report/daterangepicker/jquery-1.10.1.min.js"></script>
  <script type="text/javascript" src="/pentaho/js/jquery-1.7.2.min.js"></script>
  -->
  <script type="text/javascript" src="plugins/jQuery/jquery-1.7.2.min.js"></script>
  <script type="text/javascript" src="plugins/daterangepicker/bootstrap.min.js"></script>
  <script type="text/javascript" src="plugins/daterangepicker/moment.js"></script>
  <script type="text/javascript" src="plugins/daterangepicker/daterangepicker-1.3.7.js"></script>


  <!-- custom css-->
  <link rel="stylesheet" href="plugins/css/ReporterVersion-1.2.css" type="text/css">
  <script src='plugins/daterangepicker/location/daterangepicker-en.js'></script>
  <script type="text/javascript">
    function config() {
      /*var errMsg = document.getElementById("errorMsg");
       if ("${errorMsg}".length == 0)
       errMsg.setAttribute('class', 'hide');*/
      var button = document.getElementById("btnRunReport");
      button.addEventListener("click", function(event) {
        /*var year = document.getElementById("year").value;
         var cboMonth = document.getElementById("month");
         var month = cboMonth.options[cboMonth.selectedIndex].id;
         var cboOType = document.getElementById("outputType");
         var outputType = cboOType.options[cboOType.selectedIndex].id;*/
        /*window.location = "runReport?year=" + year +
         "&month=" + month
         + "&outputType=" + outputType;*/
        var url_param="";
        /*开始日期*/	<!-- 用正则表达式去截取开始日期  -->
        var StartDayParam = $('#reportrange span').text().match(/(\S*)~/)[1];
        if( StartDayParam!="" && StartDayParam!=undefined ) url_param = url_param + "StartDay=" + StartDayParam;

        /*结束日期*/	<!-- 用正则表达式去截取结束日期  -->
        var EndDayParam = $('#reportrange span').text().match(/~(\S*)/)[1];
        if( EndDayParam!="" && EndDayParam!=undefined )  url_param = url_param + "&EndDay=" + EndDayParam;

        /*输出类型*/
        var OutPutParam = $("#outputType").val();
        //var OutPutParam = $("#oType").val();
        if(OutPutParam!="" && OutPutParam!=undefined)	url_param = url_param + "&outputType=" + OutPutParam;

        //alert( url_param );
        var page = 0;

        /*var url="/pentaho/api/repos/%3Apublic%3Areport%3ASummaryReporter%3ASY_SummaryReport.prpt/viewer?" +
         "accepted-page=0" +
         "&paginate=false" +
         "&showParameters=false" +
         "&renderMode=REPORT" +
         "&htmlProportionalWidth=false" +
         "&webuser=admin" + url_param;

         alert(url);*/
        var url = "http://localhost:8080/Simphony/Sample?" + url_param;
        //alert(url);
        $("#report").attr("src", url);
        event.preventDefault();
      }, true);
    }

    $(window).on('load',function () {
      $.ajax({
        type : 'GET',
        url : "http://localhost:8080/Simphony/plugins/JSON.txt",
//          async : false,
        dataType : 'json',
//          data : null,
        success : function(response){
          jsonData = response;
          console.log(jsonData);
          var RevenCenterStr = "";
          $.each(
            jsonData,
            function(i,row){
              console.log(i);
              console.log(row);
              RevenCenterStr += "<option value=" + row.id + ">"+row.name + "</option>";
            }
          );
          $("#RevenCenter").html(RevenCenterStr);
        }
      })
    })

    /*$(document).ready(function() {
      $('#RevenCenter').multiselect();
    });*/
    $(window).on('load', function () {
      $('.selectpicker').selectpicker({
        'selectedText': 'cat'
      });
      // $('.selectpicker').selectpicker('hide');
    });
  </script>

</head>

<body class="bg" onload="config()">
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
    <%--<li>
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
    </li>--%>

    <!-- Brand  -->
    <%--<li>
        <div class="page-content">
            <div class="container-fluid">
                <div class="row-fluid" style="margin-top:0px">
                    <div class="span4">
                        <div class="control-group">
                            <label class="control-label filter-text">
                              RevenCenter
                            </label>
                            <div class="controls">
                                <select id="RevenCenter" name="RevenCenter" class="" style="width:190px;height:32px;margin-bottom:5px;"  >
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </li>--%>
    <select id="id_select" class="selectpicker bla bla bli" multiple data-live-search="true">
      <option>cow</option>
      <option>bull</option>
      <option>ASD</option>
      <option selected>Bla</option>
      <option>Ble</option>
      </optgroup>
    </select>
    <!-- RevenCenter  -->
    <li>
      <div class="page-content">
        <div class="container-fluid">
          <div class="row-fluid" style="margin-top:0px">
            <div class="span4">
              <div class="control-group">
                <label class="control-label filter-text">
                  RevenCenter
                </label>
                <div class="controls">
                  <select id="RevenCenter" class="" style="width:190px;height:32px;margin-bottom:5px;"  multiple="multiple" size=5>
                    <option value="V1" selected="selected">Option 1</option>
                    <option value="V2" selected="selected">Option 2</option>
                    <option value="V3" selected="selected">Option 3</option>
                    <option value="option4" selected="selected">Option 4</option>
                    <option value="option5" selected="selected">Option 5</option>
                    <option value="option6">Option 6</option>
                    <option value="option7">Option 7</option>
                    <option value="option8">Option 8</option>
                    <option value="option9">Option 9</option>
                    <option value="option10">Option 10</option>
                    <option value="option11">Option 11</option>
                    <option value="option12">Option 12</option>
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
                                        <span style="text-align:left;margin-bottom: 5px;width:80px;height:32px;" >
                                            <button id="btnRunReport" class="" style="margin-left:5px;width:80px;height:32px;font-size:11px"
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
</div>
<!-- 报表展示区域  -->
<iframe id="report" width="100%"   title="报表预览" frameborder=no style="height:500px;width:100%;padding:0px 0px;" onload="resizeReportIframe(this)" ></iframe>

</body>

<%--<script type="text/javascript">

</script>--%>
</html>
