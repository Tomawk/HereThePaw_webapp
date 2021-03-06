<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Required</title>
    <link href="../../CSS/login.css" rel="stylesheet" type="text/css">
    <link href="../../fontawesome/css/all.css" rel="stylesheet">
<!--
    <script src="https://kit.fontawesome.com/a30f811c28.js" crossorigin="anonymous"></script> -->
</head>
<body>
<nav class="topnav">
    <img src="../../images/HereThePaw_Logo.png" alt="logo">
    <table style="position:relative; left:80vw;">
        <tr>
            <td><a href="/herethepaw_webapp">Home</a></td> <!-- TODO CHANGE PATH IF REQUIRED -->
            <td><a href="#hr1">Login</a></td>
        </tr>
    </table>
</nav>
<aside class="rightnav">
    <table>
        <tr>
            <td id="facebook"></td>
        </tr>
        <tr>
            <td id="instagram"></td>
        </tr>
        <tr>
            <td id="google"></td>
        </tr>
    </table>
</aside>
<% String actual_ip = InetAddress.getLocalHost().getHostAddress(); %>
<div id="center_div">
    <div class="imgdiv">
        <img src="../../images/vertical_logo.png" alt="Avatar" class="avatar">
    </div>
    <form method="post" name="login" action="http://<%= actual_ip %>:8080/herethepaw_webapp/login"> <!-- TODO CHANGE IF REQUIRED -->
        <label><b>Username</b></label>
        <input type="text" placeholder="Insert Username" name="username" class="input" required>
        <label><b>Password</b></label>
        <input type="password" placeholder="Insert Password" name="password" class="input" required>
        <button type="submit"  class="button">Login</button>
    </form>
</div>
</body>
</html>