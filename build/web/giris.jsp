<%-- 
    Document   : giris
    Created on : 23.May.2019, 08:42:09
    Author     : PC
--%>
<%
    if (session.getAttribute("username")!=null ) {
            response.sendRedirect("index.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/header.jsp"/>
<body>
    <div class="row film-sec">
        <div class="col-md-6 mx-auto">
            <%
                String req = request.getParameter("o");
                if (req != null) {
                     
            %>
            <div class="row">
                <p> Önce giriþ yapmalýsýn.</p>
            </div>
            <%
                }
            %>
            
            <%
                req = request.getParameter("p");
                if (req != null) {
                     
            %>
            <div class="row">
                <p> Kayýt Baþarýlý!</p>
            </div>
            <%
                }
            %>
            
            <%
                req = request.getParameter("n");
                if (req != null) {
                     
            %>
            <div class="row">
                <p> Zaten Kayýtlýsýn!</p>
            </div>
            <%
                }
            %>
            <div class="row">
                <form class="form-horizontal card card-block w-50 mx-auto bg-light" action="GirisYap" method="POST" style="padding: 20px;">

                    <div class="form-group">
                    <label for="username" class=" control-label">Kullanýcý Adý</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="Kullanýcý Adý" required>
                    
                    </div>

                    <div class="form-group">
                    <label for="password" class=" control-label">Þifre</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Þifre" required>
                    
                    </div>

                    <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Giriþ Yap</button>
                    </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</body>
</html>
