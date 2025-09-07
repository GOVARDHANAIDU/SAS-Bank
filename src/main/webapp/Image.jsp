<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>All Images</title>
    <style>
        .image-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .image-item {
            text-align: center;
        }
        .image-item img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <h2>All Images</h2>
    <div class="image-grid">
    <%
        List<String> images = (List<String>) request.getAttribute("images");
        if (images != null && !images.isEmpty()) {
            for (String name : images) {
    %>
        <div class="image-item">
            <img src="GetImageServlet?name=<%= name %>" alt="Image"><br>
            <%= name %>
        </div>
    <%
            }
        } else {
    %>
        <p>No images found.</p>
    <%
        }
    %>
    </div>
</body>
</html>
