<%-- 
    Document   : header
    Created on : 23.May.2019, 10:03:38
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-9"%>
<header>
    <div class="row header">
        <div class="col-md-6 mx-auto">
            <div class="row">
                <div class="col-md-8">
                    <h3> <a class="badge badge-light" href="index.jsp"> Sinema X</a></h3>
                </div>
                <div class="col-md-4">
                    <%
                        if (session.getAttribute("username") != null) {
                            if(session.getAttribute("yetki").toString().compareTo("1") == 0){
                            %>
                                <a href="yoneticiPage.jsp" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Root Panel</a>
                                <a href="cikis" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">Çýkýþ Yap</a>
                            <%
                            }else{
                            %>
                                <a href="kullanici.jsp" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Kullanýcý</a>
                                <a href="cikis" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">Çýkýþ Yap</a>
                            <%
                            }
                        }else{
                            %>
                                <a href="uyeol.jsp" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Üye Ol</a>
                                <a href="giris.jsp" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">Giriþ Yap</a>
                            <%
                        }
                    %>

                </div>
            </div>
        </div>
    </div>
</header>
