<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-image: url('/img/back.png'); /* Path to your background image */
    background-size: cover; /* Ensure the background image covers the entire body */
    background-repeat: no-repeat; /* Prevent the background image from repeating */
    background-position: center top; /* Position the background image at the top center */
    height: 50vh; /* Set the height of the body to 50% of the viewport height */
  }
 
  body h3 {
    color: white;
    font-size: 15px;
  }

  .login-container {
    position: relative;
    height: 110vh;
  }

  .login-form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    background-color: #f2f2f2;
  }

  .login-form h1 {
    text-align: center;
    margin-bottom: 90px;
  }

  .login-form label {
    display: block;
    margin-bottom: 5px;
  }

  .login-form input[type="email"],
  .login-form input[type="password"] {
    width: calc(100% - 32px); /* Adjust width to accommodate the eye icon button */
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
  }
  .login-form button[type="submit"] {
    width: 50%;
    
    padding: 10px;
    margin-left:105px;
    background-color: blue;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .login-form button[type="submit"]:hover {
    background-color: blue;
  }
  .login-form a {
    display: block;
    text-align: right;
    font-size:12px;
    margin-top: 3px;
    color: blue;
    text-decoration: none;
    
  }

  .login-form a:hover {
    text-decoration: underline;
  }

  .password-toggle {
    position: absolute;
    top: 50%;
    right: 40px;
    transform: translateY(-50%);
    cursor: pointer;
  }
</style>
</head>
<body>
<center><h3>Online Project Management</h3></center>
  <div class="login-container">
    <div class="login-form">
      <h1>Login to get started</h1>
      <form action="/users" method="post">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
        <label for="password">Password</label>
        <div style="position: relative;">
          <input type="password" id="password" name="password" required>
          <img src="/img/eyeclose.png" alt="Toggle Password" class="password-toggle" onclick="togglePassword()">
        </div>
        <p><a href="#">Forgot password?</a></p>
        <button type="submit">Login</button>
      </form>
    </div>
  </div>

<script>
function togglePassword() {
  var passwordField = document.getElementById("password");
  var passwordToggle = document.querySelector(".password-toggle");

  if (passwordField.type === "password") {
    passwordField.type = "text";
    passwordField.style.width = "calc(100% - 32px)";
    passwordField.style.padding = "10px";
    passwordField.style.boxSizing = "border-box";
    passwordField.style.border="1px solid #ccc"
    //passwordToggle.src = "img/eyeopen.png";
  } else {
    passwordField.type = "password";
    passwordField.style.width = "calc(100% - 32px)";;
    passwordField.style.padding = "10px";
    passwordField.style.boxSizing = "border-box";
// Apply the same padding as the email input field
    //passwordToggle.src = "/img/eyeclose.png";
  }
}
</script>



</body>
</html>
