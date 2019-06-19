<%-- 
    Document   : index
    Created on : 23.May.2019, 03:45:14
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
				<form class="form-inline mx-auto" action="film.jsp" method="POST">
					<label class="my-1 mr-2" for="film_id_select">Filmi Seçiniz: </label>
					<select name="film_id" class="custom-select my-1 mr-sm-2" id="film_id_select">
                                            <%  
                                                MyDatabase db = new MyDatabase();
                                                Connection con = db.getConnection();
                                                Statement stmt = con.createStatement();
                                                ResultSet rs = stmt.executeQuery("SELECT * FROM filmler where aktif_mi = '1'");
                                                while (rs.next()) {
                                                    int id = rs.getInt("film_id");
                                                    String isim = rs.getString("isim");
                                            %>
                                            <option value="<%out.print(id); %>"><%out.print(isim); %></option>
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
