<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_reward.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderPay.css" rel="stylesheet"/>
    <title>mall</title>
    <style type="text/css">
        .frm_label{
            cursor: pointer;
            font-size: 12px;
            font-weight: normal;
            color:#666;
            margin: 0 4px 0 0;
        }
        .frm_input{
            width: 150px;
            outline: none;
            padding: 5px;
            color:#666;
            margin: 0 20px 0 0;
            height: 20px;
            border-radius: 3px;
            border: 1px solid #e9ebef;
            font-size: 12px;
            margin-top: 10px;
        }
        .frm_input:focus{
            border: 1px solid #bbb;
        }
        .frm_btn{
            transition: background-color 0.25s ease-in;
            outline: none;
            height: 20px;
            border-radius: 5px;
            padding: 8px 18px;
            border: 0;
            color:white;
            font-size: 12px;
            background-color: #ff7874;
            margin-right: 10px;
            margin-top: 10px;
        }
        .frm_btn:hover{
            background-color: #fe5874;
        }
        .messageForm {
            width: 300px;
            margin: 0 auto;
            text-align: left;
            margin-top: 10px;
        }
        /*修改多选,单选按钮样式*/
        input[type="checkbox"]+label::before {
            content: "\a0";
            position: relative;
            bottom: 1px;
            display: inline-block;
            vertical-align: middle;
            font-size: 18px;
            width: 12px;
            height: 12px;
            margin-right: .4em;
            border: 1px solid #cccccc;
            text-indent: .15em;
            line-height: 1;
            cursor: pointer;
        }
        input[type="checkbox"]:checked + label::before {
            background-color: #ff7874;
            background-clip: content-box;
            padding: 2px;
        }
        input[type="checkbox"] {
            position: absolute;
            clip: rect(0, 0, 0, 0);
        }
    </style>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">

        </div>
    </div>
</nav>
<div class="content">
    <div class="order_div">
        <c:choose>
            <c:when test="${fn:length(requestScope.productOrder.productOrderItemList)==1}">
                <div class="order_name">
                    <span>mall -- ${requestScope.productOrder.productOrderItemList[0].productOrderItem_product.product_name}</span>
                </div>

            </c:when>
            <c:otherwise>
                <div class="order_name">
                    <span>mall -- Consolidate orders：${fn:length(requestScope.productOrder.productOrderItemList)}笔</span>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="order_price">
            <span class="price_value">${requestScope.orderTotalPrice}</span>
        </div>
    </div>
    <div class="order_pay_div">
        <script>
            function pay() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/order/pay/${requestScope.productOrder.productOrder_code}",
                    type: "PUT",
                    data: null,
                    dataType: "json",
                    success: function (data) {
                        if (data.success !== true) {
                            alert("The order processing is abnormal, please try again later!");
                        }
                        location.href = "/tmall" + data.url;
                    },
                    beforeSend: function () {

                    },
                    error: function () {
                        alert("There is a problem with the payment of the order, please pay again!");
                        location.href = "/tmall/order/0/10";
                    }
                });
            }
        </script>
        <a class="order_pay_btn" href="javascript:void(0)" onclick="pay()">confirm the payment</a>
    </div>
</div>
<%@include file="include/footer_two.jsp" %>
<%@include file="include/footer.jsp" %>
</body>
