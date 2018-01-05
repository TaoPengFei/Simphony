<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <%--<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>--%>
  <script type="text/javascript" src="plugins/jQuery/jquery-1.7.2.min.js"></script>
  <script type="text/javascript" src="plugins/js/bootstrap-select.js"></script>
  <link rel="stylesheet" type="text/css" href="plugins/css/bootstrap-select.css">

  <!-- 3.0 -->
  <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
  <script type="text/javascript">
    $(function () {
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
          $("#id_select").html(RevenCenterStr);
        }
      })
    })
    $(window).on('load', function () {
      $('.selectpicker').selectpicker({
        'selectedText': 'cat'
      });
      // $('.selectpicker').selectpicker('hide');
    });

  </script>
</head>
<body>
  <%--<label for="id_select"></label>--%>
  <label for="id_select"></label>
  <select id="id_select" class="selectpicker bla bla bli" multiple data-live-search="true">
    <%--<option>cow</option>
    <option>bull</option>
    <option>ASD</option>
    <option selected>Bla</option>
    <option>Ble</option>--%>
    </optgroup>
  </select>
</body>
</html>
