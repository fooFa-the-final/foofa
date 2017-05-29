<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodtruckMain</title>
    <!-- Core CSS - Include with every page -->
    <link href="../../resources/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="../../resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../../resources/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="../../resources/css/style.css" rel="stylesheet" />
      <link href="../../resources/css/main-style.css" rel="stylesheet" />

</head>
    
    <style>
        #indexMain{ margin:60px;}
        #indexbody{margin-left: 350px;}
        #Register{margin-left: 330px;}
        #Truck{margin-left: 200px;}
        #Location{margin-left: 700px;}
    
        
        
        }
    </style>

<body>
    
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <br>

            <ul class="nav navbar-top-links navbar-right">	
            <div class="col-xs-10" style="margin-right: 550px" >
            <a class="navbar-brand" style="float:center" href="index.html">
                    <img src="../../resources/img/MainLogo.png" alt="" />
                </a>
            </div>
            </ul>
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <li class="row">
                		<div class="col-xs-10" style="margin-right: 350px">
	            			<!-- search section-->
	                        <div class="input-group custom-search-form">
	                        	<input type="text" class="form-control" placeholder="Search" style="width: 400px">
	                            <input type="text" class="form-control" placeholder="Location" style="width: 400px">
	                                <button class="btn btn-default" type="button">
	                                    <i class="fa fa-search"></i>
	                                </button>
	                        </div>
	                		<!--end search section-->
	            		</div>
                </li>
                <br>
                <br>

 
            </ul>
            
        </nav>
       <!-- end navbar top -->

    <!-- Core Scripts - Include with every page -->

       
        <!-- end page-wrapper -->

    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->

    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>

</body>
      <br>
        <br><br>
     <div class="col-lg-12">
            <br>
            <text style="float: right;"/>판매자로 가입하고싶으세요?? <a href="url" target="_blank">판매자가입</a>
        </div>
    <div id="Register">
        <u><font size="6">Join With us</font></u>
    </div>
    <br><br>
       <div class="container">
                        <div class="row" id="Truck">
                            
                            <u><font size="4">Id</font></u> <br>
                           <input id="id" type="text" name="memberId">
					<button type="button" id="idCheck">중복확인</button>
					<div id="idmessage">
                          <br>
                            </div>
                            <u><font size="4">Password</font></u> <br>
                           <input id="password" type="password" name="ps1">
                            <br><br>
                            <u><font size="4">Confirm Password</font></u> <br>
                            <input id="password" type="password" name="ps2"><u><font size="4"></font></u> <br>
                           <br>
<u><font size="4">Name</font></u> <br>
                           <input id="name" type="text" name="name">
                            <br><br>
<u><font size="4">Email</font></u> <br>
                           <input id="email" type="text" name="email">
                            <br><br>
                            				<div>
					     <label>성별</label><br>
                    <label class="radio-inline">
                    <input type="radio" name="gender" id="gender" value="F" >F
                    </label>
                    <label class="radio-inline">
                    <input type="radio" name="gender" id="gender" value="T">T
                                            </label>
				</div>
                        				<div class="col-md-offset-5 col-sm-25 col-lg-25" >
					
                    
                    <input type="submit" value="register" class="btn btn-primary">
				</div>                                               
                            

                            
                            
    </div>


           
 
    <br>
    <br>
    </div>
</html>
