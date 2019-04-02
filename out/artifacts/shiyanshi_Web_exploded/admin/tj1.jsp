<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理系统</title>
    
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	
    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    
<script type="text/javascript" src="/shiyanshi/js/WdatePicker.js"></script>
<script language="JavaScript" src="/shiyanshi/admin/js/FusionCharts.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/shiyanshi/admin/js/Date.js"></script>
  	 

  </head>
  
  <body class="">
    

    
    <div class="content">
        
        <div class="header">


            <h1 class="page-title">Home</h1>
        </div>
        
       
        <ul class="breadcrumb">
            <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">订单量分析</li>
        </ul>
        <div class="btn-toolbar">
					<div class="search-well">
					<!-- 	<form action="tj1" method="post" class="form-inline"> -->
							<input class="input-xlarge" placeholder="开始时间..." id="key"   name="starttime" type="text" onFocus="HS_setDate(this)" ><!--  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" -->
							
							<input class="input-xlarge" placeholder="截止时间..." id="key1"  name="endtime" type="text" onFocus="HS_setDate(this)"  ><!-- onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" -->
							
		                    <input type="button" value="查询" onclick="tj()">
		                    
					<!-- 	</form>	 -->
					</div>  	
		</div>
		
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title=" "> </a></div>
        <div class="container-fluid">
            <div class="row-fluid">
<div class="row-fluid">
    <div class="block">
        <a class="block-heading" data-toggle="collapse">订单量分析</a>
        <div id="page-stats" class="block-body collapse in">

            <div class="stat-widget-container">
                <div id="chartdiv" align="center"> FusionCharts. </div>
 
              
<script type="text/javascript">
var chart = new FusionCharts("/shiyanshi/admin/js/FCF_Line.swf", "ChartId", "900", "300");
  	 function tj() {
       var id=$("#id").val();
		var start = $("#key").val();
		var end=$("#key1").val();
		if (start ==""||end=="") {
			alert("查询时间不能为空！");
		} else {
			$.ajax({
				url : "admin/tj1",
				type : "post",
				data :{"starttime":start,"endtime":end},
				dataType : "json",
				success:function(result){
					//alert(result.xmlstr);
		   
		   chart.setDataXML(result.xmlstr);
		   chart.render("chartdiv");
				},
				error:function(){
				alert("error");
				}

			})
		}

	}
  	 //var xmlstr = "<graph showNames='1'  decimalPrecision='0'  > "+
  	 //"<set name='02' value='100'/>"+
  	 //"<set name='03' value='200'/>"+
  	 //"</graph>";
  	 
  	 

		</script>
            </div>
        </div>
    </div>
</div>





                    
                  <!--    <footer>
                        <hr>
                        <p class="pull-right">Collect from <a href="http://www.cssmoban.com/" title=" " target="_blank"> </a></p>

                        <p>&copy; 2012 <a href="#" target="_blank">Portnine</a></p>
                    </footer>
                    -->
            </div>
        </div>
    </div>
    


    <script src="/onlineclothessalesys/admin/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
  </body>
</html>
