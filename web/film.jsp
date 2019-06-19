<%-- 
    Document   : film.jsp
    Created on : 23.May.2019, 06:20:58
    Author     : PC
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Database.MyDatabase"%>
 
<%@page contentType="text/html" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/header.jsp"/>

<body>
	<div class="row film-sec">
		<div class="col-md-6 mx-auto">
			<div class="row">
				<form class="form-inline mx-auto" action="seans.jsp" method="POST">
					<label class="my-1 mr-2" for="seans_id_select">Seans Seçiniz: </label>
					<select name="seans_id" class="custom-select my-1 mr-sm-2" id="seans_id_select">
                                            <%  
                                                String film_idString = request.getParameter("film_id").toString();
                                                if (film_idString == null) {
                                                    response.sendRedirect("index.jsp");
                                                }
                                                int film_id = Integer.valueOf(film_idString);
                                                
                                                MyDatabase db = new MyDatabase();
                                                Connection con = db.getConnection();
                                                Statement stmt = con.createStatement();
                                                ResultSet rs = stmt.executeQuery("SELECT * FROM seanslar WHERE film_id = '"+film_id+"';");
                                                while (rs.next()) {
                                                    int id = rs.getInt("seans_id");
                                                    String tarih = rs.getString("tarih");
                                                    String saat = rs.getString("saat");
                                                    
                                            %>
                                            <option value="<%out.print(id); %>"><%out.print(tarih+" "+saat); %> </option>
                                            <%
                                                }
                                                con.close();
                                            %>
				    </select>	
				  	<button type="submit" class="btn btn-primary my-1">Seç</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
