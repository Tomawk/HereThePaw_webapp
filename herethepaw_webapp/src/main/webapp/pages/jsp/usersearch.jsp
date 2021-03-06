<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="it.unipi.dsmt.dto.UserDTO" %>
<%@ page import="it.unipi.dsmt.ejb.ReviewRemoteEJB" %>
<%@ page import="it.unipi.dsmt.interfaces.UserRemote" %>
<%@ page import="it.unipi.dsmt.interfaces.ReviewRemote" %>
<%@ page import="java.net.InetAddress" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="java.sql.SQLException" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Search page</title>
    <link href="CSS/usersearch.css" rel="stylesheet" type="text/css">
    <link href="fontawesome/css/all.css" rel="stylesheet">
</head>
<body>
<%
        String city_searched = request.getParameter("city");
        String pet_searched = request.getParameter("pet");
    UserRemote userRemoteEJB = null;
    try {
        userRemoteEJB = new UserRemoteEJB();
    } catch (NamingException e) {
        e.printStackTrace();
    }
    ArrayList<UserDTO> filtered_list = null;
    try {
        filtered_list = userRemoteEJB.getUserList(city_searched,pet_searched);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    if(city_searched.equals(""))
            city_searched = "All";
    ReviewRemote reviewRemoteEJB = null;
    try {
        reviewRemoteEJB = new ReviewRemoteEJB();
    } catch (NamingException e) {
        e.printStackTrace();
    }
    float avgRating = 0;
%>
<nav class="topnav">
    <img src="images/HereThePaw_Logo.png" alt="logo">
    <% if((session.getAttribute("logged_user")) == null){ %>
    <table style="position:relative; left:80vw;">
            <% } else {%>
        <table style="position:relative; left:62vw;">
            <% } %>
        <tr>
            <td><a href="/herethepaw_webapp">Home</a></td> <!-- TODO CHANGE PATH IF REQUIRED -->
            <% if((session.getAttribute("logged_user")) != null) { %>
                <td><a href="chat">Chat</a></td>
                <td><a href="UserListServlet?username=<%=((UserDTO)session.getAttribute("logged_user")).getUsername()%>"><i class="fas fa-user"></i>&nbsp;<%=((UserDTO)session.getAttribute("logged_user")).getUsername()%></a></td>
                <td><a href="logout">Logout</a></td>
                <td><a href="pages/jsp/requests.jsp">Booking&nbsp;<i class="far fa-bookmark"></i></a></td>
            <% } else { %>
                <td><a href="pages/jsp/login.jsp">Login</a></td>
            <% } %>
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
<div class="search_infos"><p><%= filtered_list.size()%> result found with City: <strong>"<%=city_searched%>"</strong> & Pet = <strong>"<%= pet_searched%>"</strong></p></div>
<div class="search_results">
<% for(UserDTO item:filtered_list){
         avgRating = reviewRemoteEJB.computeAvgRating(item.getUsername());
%>
        <div class="first_search_row">
            <p class="username">
                <i class="fas fa-dog"></i><strong><%= item.getUsername()%>: </strong>
            </p>
            <p class="description"><i class="far fa-comment-dots"></i>&nbsp; <%= item.getDescription()%></p>
            <button type="button" onclick="submitsearch('<%=item.getUsername()%>')">See Profile</button>
            <div class="star-rating" data-rating= <%= avgRating %>>

                <div class="empty-stars">
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                </div>

                <div class="full-stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </div>
<% } %>
</div>
<script>
    function submitsearch(username) {
        window.location.href = "UserListServlet?username=" + username ;
    }

    var starRatings = document.querySelectorAll('.star-rating');
        for (var index = 0; index < starRatings.length; index++) {
            var starRating = starRatings[index],
                fullStars = starRating.querySelector('.full-stars'),
                rating = parseFloat(starRating.dataset.rating) || 0,
                percentWidth = rating * 20;
            fullStars.style.width = percentWidth + '%';
        }
</script>
</body>
</html>
