<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <title>DHU教务管理系统-登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="/resource/commons/css/login/demo.css" />
        <link rel="stylesheet" type="text/css" href="/resource/commons/css/login/style.css" />
		<link rel="stylesheet" type="text/css" href="/resource/commons/css/login/animate-custom.css" />
    </head>
    <body>
        <div class="container">
            <header>
                <h1>教务管理系统 <span>用户登录</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="/logincheck" autocomplete="on" method="post"> 
                                <h1></h1> 
                                <p>
                                    <label for="username" class="uname" data-icon="u" > 账号 </label>
                                    <input id="username" name="username" required="required" type="text" placeholder="请输入账号名"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> 密码 </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="请输入密码" /> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">记住密码</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
								<p class="change_link">
									<font color="red">${errMsg}</font>
								</p>
                            </form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>