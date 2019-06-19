<%-- 
    Document   : uyeol
    Created on : 23.May.2019, 13:45:17
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
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
            <div class="row">
                <form class="form-horizontal card card-block w-50 mx-auto bg-light" action="KayitOl" method="POST" style="padding: 20px;">
                    <div class="form-group">
                        <label for="isim" class=" control-label">Ýsim</label>
                        <input type="text" name="isim" class="form-control" id="isim" placeholder="Ýsim" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="soyad" class=" control-label">Soy Ad</label>
                        <input type="text" name="soyad" class="form-control" id="soyad" placeholder="Soyad" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="telno" class=" control-label">Tel No</label>
                        <input type="text" name="telno" class="form-control" id="telno" placeholder="Tel No" required>
                    </div>
                    
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
                            <button type="submit" class="btn btn-primary">Üye Ol</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</body>
</html>
