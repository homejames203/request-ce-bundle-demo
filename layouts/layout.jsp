<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0">
        <link rel="apple-touch-icon" sizes="76x76" href="${bundle.location}/images/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="${bundle.location}/images/android-chrome-96x96.png" sizes="96x96">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-16x16.png" sizes="16x16">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-96x96.png" sizes="96x96">
        <link rel="shortcut icon" href="${bundle.location}/images/favicon.ico" type="image/x-icon"/>
        <app:headContent/>
        
        <%-- Bundle stylepack and scriptpack create a minified and single file of referanced stylesheet and javascript
        Add ?debugjs to the end of your URL to view individual files --%>
        
        <bundle:stylepack>
            <bundle:style src="${bundle.location}/libraries/bootstrap/css/bootstrap.min.css"/>   
            <bundle:style src="${bundle.location}/libraries/datatables/datatables.css"/>
            <bundle:style src="${bundle.location}/libraries/notifie/jquery.notifie.css"/>
            <bundle:style src="${bundle.location}/libraries/AdminLTE-Sass/build/master.css"/>
            <bundle:style src="${bundle.location}/css/custom.css"/>
            <bundle:style src="${bundle.location}/libraries/kd-typeahead/kd-typeahead.css"/>
        </bundle:stylepack>
        <link href="${bundle.location}/libraries/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <bundle:scriptpack>
            <bundle:script src="${bundle.location}/libraries/jquery/jquery.min.js" />
            <bundle:script src="${bundle.location}/libraries/underscore/underscore.js"/>
            <bundle:script src="${bundle.location}/libraries/moment/moment.js" />
            <bundle:script src="${bundle.location}/libraries/moment/moment-timezone.js" />
            <bundle:script src="${bundle.location}/libraries/datatables/datatables.js"/>
            <bundle:script src="${bundle.location}/libraries/datetimepicker-master/build/jquery.datetimepicker.full.js"/>  
            <bundle:script src="${bundle.location}/libraries/kd-search/search.js"/>
            <bundle:script src="${bundle.location}/libraries/kd-typeahead/kd-typeahead.js"/>
            <bundle:script src="${bundle.location}/libraries/kd-subforms/kd-subforms.js"/>
            <bundle:script src="${bundle.location}/libraries/bootstrap/js/bootstrap.min.js"/>
            <bundle:script src="${bundle.location}/libraries/notifie/jquery.notifie.js"/>
            <bundle:script src="${bundle.location}/libraries/typeahead/typeahead.min.js"/>
            <bundle:script src="${bundle.location}/js/catalog.js"/>
            <bundle:script src="${bundle.location}/libraries/AdminLTE-Sass/build/js/app.min.js"/>
        </bundle:scriptpack>
        <script>
            window.identity = '${identity.username}';
        </script>
        <bundle:yield name="head"/>
        <style>
            <c:if test="${not empty kapp.getAttributeValue('Logo Height Px')}">
                .navbar-brand {height:${kapp.getAttributeValue('Logo Height Px')}px;}
            </c:if>
        </style>
        <c:set scope="session" var="activePage" value="${BundleHelper.getActivePage(param.page, param.category, param.type)}"/>
    </head>
    <c:choose>
        <c:when test="${identity.anonymous}">
            <body class="hold-transition login-page" style="${BundleHelper.getLoginBackground()}">
                <div class="login-box">
                    <bundle:yield/>
                </div>
            </body>
        </c:when>
        <c:otherwise>
            <c:set var="skin" value="skin-purple-light"/>
            <body class="hold-transition ${BundleHelper.getThemeSkin(kapp)} sidebar-mini">
                <div class="wrapper">
                    <c:import url="${bundle.path}${themeBundlePathModifier}/partials/header.jsp" charEncoding="UTF-8"/>
                    <c:import url="${bundle.path}/partials/sidebar.jsp" charEncoding="UTF-8"/>
                    <div class="content-wrapper">
                        <bundle:yield/>
                    </div>
                    <c:import url="${bundle.path}${themeBundlePathModifier}/partials/footer.jsp" charEncoding="UTF-8"/>
                </div>
            </body>
        </c:otherwise>
    </c:choose>
</html>
