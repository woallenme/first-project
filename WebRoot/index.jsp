<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String base_path = request.getContextPath();
String base_basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+base_path+"/";
%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/> 
    <meta name="format-detection" content="telephone=no"> 
    <meta http-equiv="x-rim-auto-match" content="none"> 
    <title>工单报表</title>
   
    <link rel="stylesheet" type="text/css" href="<%=base_path %>/jquery/css/themes/default/jquery.mobile-1.3.2.min.css">
    <link rel="stylesheet" type="text/css" href="<%=base_path %>/jquery/css/easyui.css"> 
    
    <script type="text/javascript">
      var CONTEXT_PATH = '<%=base_basePath %>';
    </script>    
    
    <script type="text/javascript">
      var appnum=1;
      var searchnum=1;
      var refnum=0;
      var detnum=0;
    </script> 
        
    <script type="text/javascript" src="<%=base_path %>/jquery/js/jquery.min.js"></script>
    
    <script type="text/javascript" src="<%=base_path %>/jquery/js/jquery.mobile-1.3.2.min.js"></script>  
    
    <script type="text/javascript" src="<%=base_path %>/jquery/js/jquery.easyui.min.js"></script>    
    
    <script type="text/javascript" src="<%=base_path %>/jquery/js/iscroll.js"></script>


 <!-- 
//可直接通过url传参直接加载报表          
    <script>    
     function request(paras)
    { 
        var url = window.location.href; 
        var paraString = url.substring(url.indexOf("?")+1,url.length).split("&"); 
        var paraObj = {} 
        for (i=0; j=paraString[i]; i++){ 
        paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length); 
        } 
        var returnValue = paraObj[paras.toLowerCase()]; 
        if(typeof(returnValue)=="undefined"){ 
        return ""; 
        }else{ 
        return returnValue; 
        } 
    }
    </script>  
 -->            
    <script>    
    //控制自适应
    $(function() {
    if(refnum==0)
    {
            $(window).resize(function(){
            $('#dg').datagrid('resize', {
            width:function(){return document.body.clientWidth;},
            height:function(){return (document.body.clientHeight);}            
            });            
            });
            refnum++;
     }
     else{
            $(window).resize(function(){
            $('#dg').datagrid('resize', {
            width:function(){return document.body.clientWidth;},
            height:function(){return (document.body.clientHeight);}            
            });            
            });          
            myScroll.refresh();} 
            });      
     </script>  
          
     <script>
//显示加载器
function showLoader() {
    //显示加载器.for jQuery Mobile
    $.mobile.loading('show', {
        text: '加载中...', //加载器中显示的文字
        textVisible: false, //是否显示文字
        theme: 'c',        //加载器主题样式a-e
        textonly: false,   //是否只显示文字
        html: ""           //要显示的html内容，如图片等
    });
}

//隐藏加载器.for jQuery Mobile
function hideLoader()
{
    //隐藏加载器
    $.mobile.loading('hide');
}
     </script>          
     
     <script> 
           //var Type = request("type");
           var shownum = 0;           	       	        
          $(function () { 
        	  showLoader();
	        var dataTitle =     [
            {"title":"基站名称","isshow":"1","field":"mbname","width":"350","type":"1","ison":"1","item":"停电工单(待派发)"},
            {"title":"地市","isshow":"1","field":"city","width":"200","type":"1","ison":"1","item":"停电工单(待派发)"},
            {"title":"县区","isshow":"1","field":"country","width":"200","type":"1","ison":"1","item":"停电工单(待派发)"},
            {"title":"电池支撑时长","isshow":"0","field":"battery","width":"0","type":"1","ison":"0","item":"停电工单(待派发)"},
            {"title":"电池剩余时长","isshow":"0","field":"lastpower","width":"0","type":"1","ison":"1","item":"停电工单(待派发)"},
            {"title":"电力业主电话","isshow":"1","field":"poweruserphone","width":"200","type":"1","ison":"1","item":"停电工单(待派发)"},
            {"title":"供电局电话","isshow":"1","field":"powerdepphone","width":"200","type":"1","ison":"1","item":"停电工单(待派发)"},
            {"title":"维护人员电话","isshow":"0","field":"userphone","width":"0","type":"1","ison":"1","item":"停电工单(待派发)"}
        ];
        
             var json=dataTitle;
		             var rnum = json.length;
			         var textHTML = '<table id="dg" data-options="singleSelect:true,border:false,fit:true,fitColumns:true,scrollbarSize:0,onClickRow: onClickRow,showFooter:false,pagination:false,onLoadSuccess: onLoadSuccess,toolbar:\'#tb\'">';
                         textHTML += '<thead><tr>';
                         
			             
			         for(var i=0; i<rnum; i++){			         
			         if(json[i].isshow == 1)
			         {
			           shownum++;
			           textHTML += '<th data-options="field:'+'\''+json[i].field+'\''+',width:'+json[i].width+',align:\'left\',style:\'color:blue\'"><div data-role="collapsible" class="datadiv" data-inset="false" data-theme="b" data-content-theme="d"><h4>'+json[i].title+'</h4></div></th>';
			         }
			         }
			         textHTML += '</tr></thead></table>';
			         		         
			         document.getElementById("demo-data").innerHTML = textHTML;
			         $(".datadiv").collapsible();	
             $(function(){                                 
                 var data =     [
                                 {"mbname":"FI-SW-01","city":"NJ-01","country":"JN-01","battery":12.10,"lastpower":36.10,"poweruserphone":"Large-01","powerdepphone":"ESET-01","userphone":"EST-01"},
                                 {"mbname":"FI-SW-02","city":"NJ-02","country":"JN-02","battery":12.20,"lastpower":36.20,"poweruserphone":"Large-02","powerdepphone":"ESET-02","userphone":"EST-02"},
                                 {"mbname":"FI-SW-03","city":"NJ-03","country":"JN-03","battery":12.30,"lastpower":36.30,"poweruserphone":"Large-03","powerdepphone":"ESET-03","userphone":"EST-03"},                                 
                                 {"mbname":"FI-SW-04","city":"NJ-04","country":"JN-04","battery":12.40,"lastpower":36.40,"poweruserphone":"Large-04","powerdepphone":"ESET-04","userphone":"EST-04"},
                                 {"mbname":"FI-SW-05","city":"NJ-05","country":"JN-05","battery":12.50,"lastpower":36.50,"poweruserphone":"Large-05","powerdepphone":"ESET-05","userphone":"EST-05"},
                                 {"mbname":"FI-SW-06","city":"NJ-06","country":"JN-06","battery":12.60,"lastpower":36.60,"poweruserphone":"Large-06","powerdepphone":"ESET-06","userphone":"EST-06"},
                                 {"mbname":"FI-SW-07","city":"NJ-07","country":"JN-07","battery":12.70,"lastpower":36.70,"poweruserphone":"Large-07","powerdepphone":"ESET-07","userphone":"EST-07"},
                                 {"mbname":"FI-SW-08","city":"NJ-08","country":"JN-08","battery":12.80,"lastpower":36.80,"poweruserphone":"Large-08","powerdepphone":"ESET-08","userphone":"EST-08"},
                                 {"mbname":"FI-SW-09","city":"NJ-09","country":"JN-09","battery":12.90,"lastpower":36.90,"poweruserphone":"Large-09","powerdepphone":"ESET-09","userphone":"EST-09"},
                                 {"mbname":"FI-SW-00","city":"NJ-00","country":"JN-00","battery":12.00,"lastpower":36.00,"poweruserphone":"Large-00","powerdepphone":"ESET-00","userphone":"EST-00"}                          
                             ];       
                $('#dg').datagrid({ 
                 data: data
            });
                        
            $("#more").append('<tr class="datagrid-row"><td colspan=\"'+shownum+'\"><div id="pullUp" style="text-align: left; height: auto;"><span class="pullUpIcon"></span><span class="pullUpLabel">上拉显示更多...</span></div></td></tr>');       
            $('.datagrid-cell-c-mbname').css('color','#125f9a');            
            loaded();                              
            });
             hideLoader();
                  });

	       
	       	     
	         function showmore(Type){
	        	 showLoader();
	                 var data =     [
	                                 {"mbname":"FI-SW-01","city":"NJ-01","country":"JN-01","battery":12.10,"lastpower":36.10,"poweruserphone":"Large-01","powerdepphone":"ESET-01","userphone":"EST-01"},
	                                 {"mbname":"FI-SW-02","city":"NJ-02","country":"JN-02","battery":12.20,"lastpower":36.20,"poweruserphone":"Large-02","powerdepphone":"ESET-02","userphone":"EST-02"},
	                                 {"mbname":"FI-SW-03","city":"NJ-03","country":"JN-03","battery":12.30,"lastpower":36.30,"poweruserphone":"Large-03","powerdepphone":"ESET-03","userphone":"EST-03"},                                 
	                                 {"mbname":"FI-SW-04","city":"NJ-04","country":"JN-04","battery":12.40,"lastpower":36.40,"poweruserphone":"Large-04","powerdepphone":"ESET-04","userphone":"EST-04"},
	                                 {"mbname":"FI-SW-05","city":"NJ-05","country":"JN-05","battery":12.50,"lastpower":36.50,"poweruserphone":"Large-05","powerdepphone":"ESET-05","userphone":"EST-05"},
	                                 {"mbname":"FI-SW-06","city":"NJ-06","country":"JN-06","battery":12.60,"lastpower":36.60,"poweruserphone":"Large-06","powerdepphone":"ESET-06","userphone":"EST-06"},
	                                 {"mbname":"FI-SW-07","city":"NJ-07","country":"JN-07","battery":12.70,"lastpower":36.70,"poweruserphone":"Large-07","powerdepphone":"ESET-07","userphone":"EST-07"},
	                                 {"mbname":"FI-SW-08","city":"NJ-08","country":"JN-08","battery":12.80,"lastpower":36.80,"poweruserphone":"Large-08","powerdepphone":"ESET-08","userphone":"EST-08"},
	                                 {"mbname":"FI-SW-09","city":"NJ-09","country":"JN-09","battery":12.90,"lastpower":36.90,"poweruserphone":"Large-09","powerdepphone":"ESET-09","userphone":"EST-09"},
	                                 {"mbname":"FI-SW-00","city":"NJ-00","country":"JN-00","battery":12.00,"lastpower":36.00,"poweruserphone":"Large-00","powerdepphone":"ESET-00","userphone":"EST-00"}                          
	                             ];
	                 var json=data;

                   if(json != ''){
		             var rnum=json.length;
		             if(json.length < 10)
		             {
		              for(var j=0;j<json.length;j++)
                   {
                    $('#dg').datagrid('appendRow',
                           json[j]); 
                    }
		             }
		             else{
                   for(var j=0;j<10;j++)
                   {
                    $('#dg').datagrid('appendRow',
                           json[j]); 
                    }
                    }
                    $('.datagrid-cell-c-mbname').css('color','#125f9a');                            
                    }
                 if(json == ''){
                       $('#popupDialogR').popup('open'); 
                   }
                      myScroll.refresh();
                      hideLoader();
               appnum++;
                    }                
	         	      
	      function onLoadSuccess()
	      {
	       $('.datagrid-cell-c-mbname').css('color','#125f9a'); 
	      }       
	 </script> 

	  <script type="text/javascript">
		var onTelclick =  function(order){
	    	window.workMsg.clickonAndroid(order);
	    }	       	  
	  </script>     
	  
	  	<script>     	      
      function onClickRow(rowIndex,rowData)
	      {	      	
	      	 var rIndex = undefined;
	         if (rIndex != rowIndex){
	             var seldata = rowData;	             
	 	        var dataTitle =     [
	 	                            {"title":"基站名称","isshow":"1","field":"mbname","width":"350","type":"1","ison":"1","item":"停电工单(待派发)"},
	 	                            {"title":"地市","isshow":"1","field":"city","width":"200","type":"1","ison":"1","item":"停电工单(待派发)"},
	 	                            {"title":"县区","isshow":"1","field":"country","width":"200","type":"1","ison":"1","item":"停电工单(待派发)"},
	 	                            {"title":"电池支撑时长","isshow":"0","field":"battery","width":"0","type":"1","ison":"0","item":"停电工单(待派发)"},
	 	                            {"title":"电池剩余时长","isshow":"0","field":"lastpower","width":"0","type":"1","ison":"1","item":"停电工单(待派发)"},
	 	                            {"title":"电力业主电话","isshow":"1","field":"poweruserphone","width":"200","type":"1","ison":"1","item":"停电工单(待派发)"},
	 	                            {"title":"供电局电话","isshow":"1","field":"powerdepphone","width":"200","type":"1","ison":"1","item":"停电工单(待派发)"},
	 	                            {"title":"维护人员电话","isshow":"0","field":"userphone","width":"0","type":"1","ison":"1","item":"停电工单(待派发)"}
	 	                        ];
	 	                        
	 	     var json=dataTitle;
		     var rnum=json.length;
             var textHTML = '<form><ul id="detailul">';			             
			         for(var i=0; i<rnum; i++){
			         if(json[i].ison == 1)
			         {
			           if(json[i].field == "powerdepphone" || json[i].field == "poweruserphone" || json[i].field == "userphone")
			           {
			           textHTML += '<li data-role="fieldcontain" class="ui-field-contain ui-body ui-br">';
			           textHTML += '<font color="#5B92C0"><strong>'+json[i].title+'\：</strong></font>';
			           textHTML += '<a href="tel:'+seldata[json[i].field]+'" onclick="onTelclick('+seldata[json[i].field]+')">';
			           textHTML += '<img src="<%=base_path %>/sendphone.png"/>';
			           textHTML += '<strong>'+seldata[json[i].field]+'</strong>';
			           textHTML += '</a></li>';
			           }
			           if(json[i].field != "userphone" && json[i].field != "powerdepphone" && json[i].field != "poweruserphone")
			           {
			           textHTML += '<li data-role="fieldcontain" class="ui-field-contain ui-body ui-br">';
			           textHTML += '<font color="#5B92C0"><strong>'+json[i].title+'\：</strong></font>';
			           textHTML += '<strong>'+seldata[json[i].field]+'</strong>';
			           textHTML += '</li>';
			           }
			          }
			         }
			         textHTML += "</ul></form>";			         
			         document.getElementById("detail-data").innerHTML = textHTML;
                        $(function() {
                          if(detnum==0)
                       {
			               $(function(){setTimeout(function () { loadeddet(); }, 1200);});
			               detnum++;
			           }
			           else{$(function(){setTimeout(function () { myScrolldet.refresh(); }, 1000);});}	});         	         			         
                       $(function() {
                       $.mobile.changePage("#detail-page",
                        { transition: "slideup" });
                        });                                                                                                                                            
            }   
	      }	      	     
    </script> 

<script type="text/javascript">

var myScroll,
	pullUpEl, pullUpOffset;

function pullUpAction () {
	setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
		showmore(1);
		
		myScroll.refresh();		// Remember to refresh when contents are loaded (ie: on ajax completion)
	}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
}

function loaded() {
	pullUpEl = document.getElementById('pullUp');	
	pullUpOffset = pullUpEl.offsetHeight;
	
	myScroll = new iScroll('wrapper', {
		useTransition: true,
		//topOffset: pullDownOffset,
		onRefresh: function () {
            if (pullUpEl.className.match('加载中')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉显示更多...';
			}
		},
		onScrollMove: function () {
			if  (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
				pullUpEl.className = 'flip';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '释放更新...';
				this.maxScrollY = this.maxScrollY;
			} else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉显示更多...';
				this.maxScrollY = pullUpOffset;
			}
		},
		onScrollEnd: function () {
			if  (pullUpEl.className.match('flip')) {
				pullUpEl.className = '加载中';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';				
				pullUpAction();	// Execute custom function (ajax call?)
			}
		}
	});
	
	setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
</script>

<script type="text/javascript">
var myScrolldet;

function loadeddet() {
	myScrolldet = new iScroll('detail-page');
}
</script>     
    	<style>				
#pullUp {
	background:#fff;
	height:40px;
	line-height:40px;
	padding:5px 10px;
	border-bottom:1px solid #ccc;
	font-weight:bold;
	font-size:14px;
	color:#888;
}
#pullUp .pullUpIcon  {
	display:block; float:left;
	width:40px; height:40px;
	background:url(pull-icon@2x.png) 0 0 no-repeat;
	-webkit-background-size:40px 80px; background-size:40px 80px;
	-webkit-transition-property:-webkit-transform;
	-webkit-transition-duration:250ms;	
}
#pullUp .pullUpIcon  {
	-webkit-transform:rotate(-180deg) translateZ(0);
}

#pullUp.flip .pullUpIcon {
	-webkit-transform:rotate(0deg) translateZ(0);
}

#pullUp.loading .pullUpIcon {
	background-position:0 100%;
	-webkit-transform:rotate(0deg) translateZ(0);
	-webkit-transition-duration:0ms;

	-webkit-animation-name:loading;
	-webkit-animation-duration:2s;
	-webkit-animation-iteration-count:infinite;
	-webkit-animation-timing-function:linear;
}

@-webkit-keyframes loading {
	from { -webkit-transform:rotate(0deg) translateZ(0); }
	to { -webkit-transform:rotate(360deg) translateZ(0); }
}
    </style>
</head>
<body> 

<div data-role="page" id="demo-mail" data-title="工单报表" data-theme="d">

 <div id="demo-data" data-role="content" class="panel-fit" style="position: absolute;width: 100%;height: -webkit-calc(100% - 0px)">
  
  	 <style scoped>
        .panel-title{
            text-align:center;
            font-size:14px;
            font-weight:bold;
            text-shadow:0 -1px rgba(0,0,0,0.3);
        }
        .datagrid-row,.datagrid-header-row{
            height:35px;
        }
        .datagrid-body td{  
            border-right:1px dotted transparent;  
            border-bottom:1px dotted transparent;  
        }  
    </style>
    </div><!-- /content --> 
</div><!-- /page -->

<div data-role="page" id="detail-page" data-title="工单明细"  data-theme="d" class="panel-fit" style="position: absolute;width: 100%;height: -webkit-calc(100% - 0px)">
<div id="detail-data" data-role="content"></div>
</div>
<style>
ul{
    list-style-type:none;
    margin:2px;
    padding:3px;
}
 li{list-style-type:none;}
</style>
</body>       
</html>