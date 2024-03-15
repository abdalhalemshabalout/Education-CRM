<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="components/login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>

	
<div class="container">
    <div class="row px-3">
        <div class="col-lg-10 col-xl-9 card flex-row mx-auto px-0">
            <div class="img-left d-none d-md-flex"></div>

            <div class="card-body">
                <h4 class="title text-center mt-4">
                    Login
                </h4>
                <form class="form-box px-3" action="Login" method="post">
                    
                    <div class="form-input">
                        <span><i class="fa fa-envelope-o"></i></span>
                        <input type="email" name="email" placeholder="Email Address" >
                    </div>
                    <div class="form-input">
                        <span><i class="fa fa-key"></i></span>
                        <input type="password" name="password" placeholder="Password">
                    </div>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-block text-uppercase">
                            Login
                        </button>
                    </div>


                    <div class="text-center mb-3">

                    </div>

                    <hr class="my-4">

                    <div class="text-center mb-2">
                        Don't have an account?
                        <a href="main.jsp" class="register-link">
                            Back to Home
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>