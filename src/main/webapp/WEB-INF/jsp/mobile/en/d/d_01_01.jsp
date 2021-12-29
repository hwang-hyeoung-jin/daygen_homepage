<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container ir">
    <div class="sub_top">
        <div class="wrap_1296">
            <div class="txt_box">
                <h4>IR</h4>
            </div>
        </div>
    </div>
    <div class="content sub_cont01">
        <div class="wrap_1296">
            <ul>
                <li>
                    <h4>Financial Status</h4>
                    <div>
                        <p>It is being prepared</p>
                        <!-- <p>2020 Financial Statement</p> -->
                        <!-- <span>2021-06-07</span>
                        <a href="javascript:;">Download</a> -->
                    </div>
                </li>
                <li>
                    <h4>Information Disclosure </h4>
                    <div>
                        <p>It is being prepared</p>
                        <!-- <p>2020 Information Disclosure</p> -->
                        <!-- <span>2021-06-07</span>
                        <a href="javascript:;">Download</a> -->
                    </div>
                </li>
                <li>
                    <h4>Investment Relations Report</h4>
                    <div>
                        <p>2021 IR Report</p>
                        <span>2021-06-25</span>
                        <a href='<c:url value='/download/2021_IR.pdf?ver=210625'/>' target="_blank">Download</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>