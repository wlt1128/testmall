<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/admin/admin_login.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/admin/admin_login.css"/>
    <title>mall</title>
</head>
<body>
<div id="div_background">
    <div id="div_nav">
        <span id="txt_date"></span>
        <ul id="div_peelPanel">
            <li value="url(${pageContext.request.contextPath}/res/images/admin/loginPage/background-1.jpg)">
                <img src="${pageContext.request.contextPath}/res/images/admin/loginPage/background-mini-1.jpg"/>
            </li>

        </ul>
    </div>
    <div id="div_main">
        <div id="div_head"><p>mall <span>admin Background</span></p></div>
        <div id="div_content">
            <form id="form_login">
                <input type="text" class="form-control form_control" placeholder="username" id="input_username" />
                <input type="password" class="form-control form_control" placeholder="password" id="input_password"  autocomplete="on">
                <span id="txt_error_msg"></span>
                <input type="button" class="btn btn-danger" id="btn_login" value="login"/>
            </form>
        </div>
    </div>

</div>
</body>
