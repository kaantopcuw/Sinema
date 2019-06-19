<%-- 
    Document   : seans
    Created on : 23.May.2019, 06:54:45
    Author     : PC
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Database.MyDatabase"%>
<%@page import="Database.MyDatabase"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/header.jsp"/>
<script type="text/javascript">
    function kontrol(max) {
        var kisi_sayisi = document.getElementById("kisi_sayisi");
        if (parseInt(kisi_sayisi.value)>max) {
            kisi_sayisi.value = "";
        }
    }

</script>
<body>
	<div class="row film-sec">
		<div class="col-md-6 mx-auto">
			<div class="row">
				<form class="mx-auto" action="rezervasyonKaydet.jsp" method="POST">
					
                        <%  
                            String seans_idString = request.getParameter("seans_id").toString();
                            if (seans_idString == null) {
                                response.sendRedirect("index.jsp");
                            }
                            int seans_id = Integer.valueOf(seans_idString);
                            
                            MyDatabase db = new MyDatabase();
                            Connection con = db.getConnection();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT seanslar.seans_id, seanslar.salon_id, salonlar.isim, seanslar.film_id, filmler.isim, tarih,saat, kalan_kapasite, seanslar.aciklama FROM cinema.seanslar inner join salonlar on salonlar.salon_id = seanslar.salon_id inner join filmler on filmler.film_id = seanslar.film_id where seanslar.seans_id = '"+seans_id+"' AND seans_aktif_mi = '1';");
                            while (rs.next()) {
                                int id = rs.getInt("seans_id");
                                String salonIsim = rs.getString("salonlar.isim");
                                int kalan_kapasite = rs.getInt("kalan_kapasite");
                                String filmIsim = rs.getString("filmler.isim");
                                String tarih = rs.getString("tarih");
                                String saat = rs.getString("saat");
                        %>
                        <div class="form-group row">
                            <label for="salonIsimStatic" class="col-sm-5 col-form-label">Salon Ýsim:</label>
                            <div class="col-sm-7">
                                <input type="text" readonly class="form-control-plaintext" id="salonIsimStatic" value="<%out.print(salonIsim); %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="filmIsimStatic" class="col-sm-5 col-form-label">Film Ýsim:</label>
                            <div class="col-sm-7">
                                <input type="text" readonly class="form-control-plaintext" id="filmIsimStatic" value="<%out.print(filmIsim); %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="tarihStatic" class="col-sm-5 col-form-label">Tarih:</label>
                            <div class="col-sm-7">
                                <input type="text" readonly class="form-control-plaintext" id="tarihStatic" value="<%out.print(tarih); %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="saatStatic" class="col-sm-5 col-form-label">Saat:</label>
                            <div class="col-sm-7">
                                <input type="text" readonly class="form-control-plaintext" id="saatStatic" value="<%out.print(saat); %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="kisi_sayisi" class="col-sm-5 col-form-label">Kaç Kiþi:</label>
                            <div class="col-sm-7">
                                <input name="kisi_sayisi" type="text" class="form-control" id="kisi_sayisi" placeholder="Max <%out.print(kalan_kapasite); %>" onkeyup="kontrol(<%out.print(kalan_kapasite); %>)">
                            </div>
                        </div>
                        <input name="seans_id" type="text" value="<%out.print(id); %>" style="display: none;" />
                        <button type="submit" class="btn btn-primary my-1">Kaydet</button>
                        
                        <%
                            }
                            con.close();
                        %>	
				  	
				</form>
			</div>
		</div>
	</div>
</body>
</html>
