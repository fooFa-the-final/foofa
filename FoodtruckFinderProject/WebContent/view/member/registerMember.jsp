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
    #register{ margin:120px;}
        #registerMember{margin: 50px;}
        
    
    </style>

<body>
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->

            <ul class="nav navbar-top-links navbar-right">	
   
                
            <div class="col-xs-10" style="margin-right: 550px">
            <a class="navbar-brand" style="float:center" href="index.html">
                    <img src="../../resources/img/logo.png" alt="" />
                </a>
            </div>
            </ul>

        </nav>
        <!-- end navbar top -->
    <!-- Core Scripts - Include with every page -->

                <!-- Page Header -->
        <div class="col-lg-12">
            <br>
            <text style="float: right;"/>판매자로 가입하고싶으세요?? <a href="url" target="_blank">판매자가입</a>
        </div>
                <div id="registerMember" class="col-lg-11">
                    <h1 class="page-header">회원가입</h1>
                </div>
                <!--End Page Header -->
        <div id="register">
<div class="center" style="12">
					<label>아이디 </label> 
    <br><input id="id" type="text" name="memberId">
					<button type="button" id="idCheck">중복확인</button>
					<div id="idmessage"></div>
				</div>
            <br>
				<div>
					<label>비밀번호</label> <br><input type="password" name="password"
						id="ps1">
				</div>
            <br>
				<div>
					<label>비밀번호확인</label> <br><input type="password" name="password"
						id="ps2">
					<div id="spnText"></div>
				</div>
            <br>
            <div>
					<label>생년월일</label><br> <input type="text" name="birthday">
				</div>
            <br>
				<div>
					<label>Email</label><br> <input type="text" name="email" >

				</div>
            <br>
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

        </div>
       
        <!-- end page-wrapper -->

    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->

    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>

</body>

</html>
