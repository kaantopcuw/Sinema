<%-- 
    Document   : kullanici
    Created on : 23.May.2019, 09:22:16
    Author     : PC
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Database.MyDatabase"%>
<%
    if (session.getAttribute("username")==null || session.getAttribute("yetki").toString().compareTo("0") != 0) {
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
            <div class="row">
                <form class="mx-auto">
                    <div class="form-group row">
                        <label class="col-sm-10 col-form-label"> <h5>Kullanýcý Bilgileri</h5></label>
                    </div>
                    <div class="form-group row">
                        <label for="isimStatic" class="col-sm-5 col-form-label">Ýsim:</label>
                        <div class="col-sm-7">
                            <input type="text" readonly class="form-control-plaintext" id="isimStatic" value="<%out.print(session.getAttribute("isim")); %>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="soyAdStatic" class="col-sm-5 col-form-label">Soyad:</label>
                        <div class="col-sm-7">
                            <input type="text" readonly class="form-control-plaintext" id="soyAdStatic" value="<%out.print(session.getAttribute("soyad")); %>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="telNoStatic" class="col-sm-5 col-form-label">Tel No:</label>
                        <div class="col-sm-7">
                            <input type="text" readonly class="form-control-plaintext" id="telNoStatic" value="<%out.print(session.getAttribute("telno")); %>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="usernameStatic" class="col-sm-5 col-form-label">User Name:</label>
                        <div class="col-sm-7">
                            <input type="text" readonly class="form-control-plaintext" id="usernameStatic" value="<%out.print(session.getAttribute("username")); %>">
                        </div>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="col-sm-12 text-center">
                    <label class="col-form-label "> <h5>Rezervasyon Bilgileri</h5></label>
                </div>
                <%  
                    String user_idStr = session.getAttribute("user_id").toString();
                    int user_id = Integer.valueOf(user_idStr);

                    MyDatabase db = new MyDatabase();
                    Connection con = db.getConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM rezervasyonlar inner join seanslar on seanslar.seans_id = rezervasyonlar.seans_id inner join salonlar on salonlar.salon_id = seanslar.salon_id inner join filmler on seanslar.film_id = filmler.film_id where rezervasyonlar.user_id = '"+user_id+"'");
                    while (rs.next()) {
                        String salonIsim = rs.getString("salonlar.isim");
                        String filmIsim = rs.getString("filmler.isim");
                        String tarih = rs.getString("tarih");
                        String saat = rs.getString("saat");
                        int koltuk_sayisi = rs.getInt("koltuk_sayisi");
                %>
                <div class="col-sm-12 ">
                    <input type="text" readonly class="form-control-plaintext text-center" id="isimStatic" value="<%out.print(filmIsim+" -- "+salonIsim+" -- "+tarih+" -- "+saat+" -- Kaç Kiþilik: "+koltuk_sayisi); %>">
                </div>
                <%
                    }
                    con.close();
                %>    
            </div>
        </div>
    </div>
</body>
</html>
