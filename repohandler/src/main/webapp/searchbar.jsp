<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Autocomplete Example</title>
  <link rel="stylesheet" href="css/jquery-ui.css">
  <script src="js/jquery-1.11.2.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script>
  $(function() {
	
	  $('#tags').keypress(function () {	  
		  $.ajax({
			  url:"Auto",
			  type:"post",
			  data:'',
			  success:function(data){
				  $( "#tags" ).autocomplete({			
				      source: data	  
				    });
				
			  },error:  function(data, status, er){
		            console.log(data+"_"+status+"_"+er);
		        },
		        
		  });
		 
	   });

  });
  </script>
</head>
<body>

  <h4 style='font-family:courier'>Search through topics</h4>
 
  <input type=text id="tags" placeholder='please write some topic name'>
  <button onclick='valydt()'>find resources <span class="glyphicon glyphicon-search"></span></button>
 <script>
 function valydt(){
	 var s=document.getElementById("tags").value;
	 //alert(s);
	 window.location.href="jsp/topicSearchResult.jsp?str="+s+"";
 }
 </script>
 
</body>
</html>