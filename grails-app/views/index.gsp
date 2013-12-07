<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Diet Recall</title>
</head>
<body>	
    
  <div class="navbar navbar-fixed-top">
   <div class="navbar-inner">
     <div class="container">
       <a href="/DietRecall" class="brand"><i class="fa fa-th-large"></i>&nbsp;Diet Recall</a>
       <div class="nav-collapse collapse" id="main-menu">
        <ul class="nav" id="main-menu-left">
            <li>
              <a href="/DietRecall"><i class="fa fa-home fa-fw"></i>Home</a>
            </li>
        </ul>
        <ul class="nav pull-right" id="main-menu-right">
            <li><a href="#/login"><i class="fa fa-key"></i>&nbsp;Login</a></li>
            <li>
              <a href=""><i class="fa fa-info-circle"></i>&nbsp;Help</a>
            </li>
        </ul>
       </div>
     </div>
   </div>
 </div>
    
	<br />
	<br />
	<br />
    <div class="mainView">

		<div ng-view></div>
		
	
      <footer class="fixed-bottom">
      	<hr>
        <p>© Ardhika 2013</p>
      </footer>

    </div>

</body>
</html>
