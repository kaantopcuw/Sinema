<%-- 
    Document   : yoneticiPage
    Created on : 23.May.2019, 09:21:44
    Author     : PC
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Database.MyDatabase"%>
<%
    if (session.getAttribute("username")==null || session.getAttribute("yetki").toString().compareTo("1") != 0) {
            response.sendRedirect("index.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/header.jsp"/>
<body>
    <%
        MyDatabase db = new MyDatabase();
        Connection con = db.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs;
        
        String film_aktif_yap= request.getParameter("film_id_aktifYap");
        if (film_aktif_yap != null) {
            int update = stmt.executeUpdate("UPDATE filmler SET aktif_mi = '1' where (film_id = '"+film_aktif_yap+"');");
            if(update>0){
            %>
                <div class="alert alert-success" role="alert">
                    Aktif edildi.
                </div>
            <% }else{
            %>
                <div class="alert alert-danger" role="alert">
                    Aktif edilemedi.
                </div>
            <%
                }
        }
    %>

    <%
        String film_pasif_yap= request.getParameter("film_id_PasifYap");
        if (film_pasif_yap != null) {
            int update = stmt.executeUpdate("UPDATE filmler SET aktif_mi = '0' WHERE (film_id = '"+film_pasif_yap+"');");
            if(update>0){
            %>
                <div class="alert alert-success" role="alert">
                    Pasif edildi.
                </div>
            <% }else{
            %>
                <div class="alert alert-danger" role="alert">
                    Pasif edilemedi.
                </div>
            <%
                }
        }
    %>
    <%
        String seans_id_AktifYap= request.getParameter("seans_id_AktifYap");
        if (seans_id_AktifYap != null) {
            int update = stmt.executeUpdate("UPDATE seanslar SET seans_aktif_mi = '1' WHERE (seans_id = '"+seans_id_AktifYap+"');");
            if(update>0){
            %>
                <div class="alert alert-success" role="alert">
                    Pasif edildi.
                </div>
            <% }else{
            %>
                <div class="alert alert-danger" role="alert">
                    Pasif edilemedi.
                </div>
            <%
                }
        }
    %>
    <%
        String seans_id_PasifYap= request.getParameter("seans_id_PasifYap");
        if (seans_id_PasifYap != null) {
            int update = stmt.executeUpdate("UPDATE seanslar SET seans_aktif_mi = '0' WHERE (seans_id = '"+seans_id_PasifYap+"');");
            if(update>0){
            %>
                <div class="alert alert-success" role="alert">
                    Pasif edildi.
                </div>
            <% }else{
            %>
                <div class="alert alert-danger" role="alert">
                    Pasif edilemedi.
                </div>
            <%
                }
        }
    %>
    
    <%
        if (request.getParameter("sAdd") != null) {
        %>
                <div class="alert alert-success" role="alert">
                    Seans Eklendi.
                </div>
     <% }
        if(request.getParameter("sNo") != null){
     %>
            <div class="alert alert-danger" role="alert">
                Seans Eklenemedi.
            </div>
     <%
        }
     %>
    <div class="row film-sec">
        <div class="col-md-6 mx-auto">
            <div class="row">
                <form class="form-inline mx-auto" action="" method="POST">
                    <label class="my-1 mr-2" for="film_id_aktifYap">Filmi Aktifleþtir: </label>
                    <select name="film_id_aktifYap" class="custom-select my-1 mr-sm-2" id="film_id_aktifYap">
                        <%  
                            rs = stmt.executeQuery("SELECT * FROM filmler where aktif_mi = '0'");
                            while (rs.next()) {
                                int id = rs.getInt("film_id");
                                String isim = rs.getString("isim");
                        %>
                            <option value="<%out.print(id); %>"><%out.print(isim); %></option>
                        <%
                            }
                            
                        %>
                    </select>	
                    <button type="submit" class="btn btn-primary my-1">Aktif Et</button>
                </form>
            </div>
            <div class="row">
                <form class="form-inline mx-auto" action="" method="POST">
                    <label class="my-1 mr-2" for="film_id_PasifYap">Filmi Pasif Et: </label>
                    <select name="film_id_PasifYap" class="custom-select my-1 mr-sm-2" id="film_id_PasifYap">
                        <%  
                            
                            rs = stmt.executeQuery("SELECT * FROM filmler where aktif_mi = '1'");
                            while (rs.next()) {
                                int id = rs.getInt("film_id");
                                String isim = rs.getString("isim");
                        %>
                            <option value="<%out.print(id); %>"><%out.print(isim); %></option>
                        <%
                            }
                            
                        %>
                    </select>	
                    <button type="submit" class="btn btn-primary my-1">Pasif Et</button>
                </form>
            </div>
            <div class="row">
                <form class="form-inline mx-auto" action="" method="POST">
                    <label class="my-1 mr-2" for="seans_id_AktifYap">Seans Aktif Et: </label>
                    <select name="seans_id_AktifYap" class="custom-select my-1 mr-sm-2" id="seans_id_AktifYap">
                        <%  
                            
                            rs = stmt.executeQuery("SELECT seanslar.seans_id, seanslar.salon_id, salonlar.isim, seanslar.film_id, filmler.isim, tarih,saat, kalan_kapasite, seanslar.aciklama FROM cinema.seanslar inner join salonlar on salonlar.salon_id = seanslar.salon_id inner join filmler on filmler.film_id = seanslar.film_id where seans_aktif_mi = '0'");
                            while (rs.next()) {
                                int id = rs.getInt("seans_id");
                                String salon_isim = rs.getString("salonlar.isim");
                                String film_isim = rs.getString("filmler.isim");
                                String tarih = rs.getString("tarih");
                                String saat = rs.getString("saat");
                        %>
                            <option value="<%out.print(id); %>"><%out.print(salon_isim+"--"+film_isim+"--"+tarih+"--"+saat); %></option>
                        <%
                            }
                            
                        %>
                    </select>	
                    <button type="submit" class="btn btn-primary my-1">Aktif Et</button>
                </form>
            </div>
            <div class="row">
                <form class="form-inline mx-auto" action="" method="POST">
                    <label class="my-1 mr-2" for="seans_id_PasifYap">Seans Pasif Et: </label>
                    <select name="seans_id_PasifYap" class="custom-select my-1 mr-sm-2" id="seans_id_PasifYap">
                        <%  
                            
                            rs = stmt.executeQuery("SELECT seanslar.seans_id, seanslar.salon_id, salonlar.isim, seanslar.film_id, filmler.isim, tarih,saat, kalan_kapasite, seanslar.aciklama FROM cinema.seanslar inner join salonlar on salonlar.salon_id = seanslar.salon_id inner join filmler on filmler.film_id = seanslar.film_id where seans_aktif_mi = '1'");
                            while (rs.next()) {
                                int id = rs.getInt("seans_id");
                                String salon_isim = rs.getString("salonlar.isim");
                                String film_isim = rs.getString("filmler.isim");
                                String tarih = rs.getString("tarih");
                                String saat = rs.getString("saat");
                        %>
                            <option value="<%out.print(id); %>"><%out.print(salon_isim+"--"+film_isim+"--"+tarih+"--"+saat); %></option>
                        <%
                            }
                            
                        %>
                    </select>	
                    <button type="submit" class="btn btn-primary my-1">Pasif Et</button>
                </form>
            </div>
            <div class="row">
                <form class="form-horizontal card card-block col-md-6 bg-light mx-auto" action="SeansEkle" method="POST" style="padding: 20px;">
                    <div class="form-group">
                        <label for="isim" class=" control-label"><h4>Seans Ekle</h4></label>
                    </div>
                    <div class="form-group">
                        <label for="salon_id" class=" control-label">Salon</label>
                        <select name="salon_id" class="custom-select form-control" id="salon_id">
                            <%  

                                rs = stmt.executeQuery("SELECT * FROM salonlar");
                                while (rs.next()) {
                                    int id = rs.getInt("salon_id");
                                    String isim = rs.getString("isim");
                                    String kapasite = rs.getString("kapasite");
                            %>
                                <option value="<%out.print(id); %>"><%out.print(isim+" Kapasite:"+kapasite); %></option>
                            <%
                                }

                            %>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="film_id" class=" control-label">Film</label>
                        <select name="film_id" class="custom-select form-control" id="film_id">
                            <%  

                                rs = stmt.executeQuery("SELECT * FROM filmler");
                                while (rs.next()) {
                                    int id = rs.getInt("film_id");
                                    String isim = rs.getString("isim");
                            %>
                                <option value="<%out.print(id); %>"><%out.print(isim); %></option>
                            <%
                                }

                            %>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="tarih" class=" control-label">Tarih</label>
                        <input type="text" name="tarih" class="form-control" id="tarih" placeholder="Tarih" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="saat" class=" control-label">Saat</label>
                        <input type="text" name="saat" class="form-control" id="saat" placeholder="Saat" required>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Seans Ekle</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</body>
</html>


