<%-- 
    Document   : horoscopo
    Created on : 12 feb. 2021, 13:06:57
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
         <div class="container">
             <div class="row">
                 <div class="col-6">
                     <h1>Horóscopo</h1>
                    <form action="horoscopo" method="post">
                         <%    ArrayList<String> meses = (ArrayList<String>) request.getAttribute("meses"); 
                               ArrayList<String> dias = (ArrayList<String>) request.getAttribute("dias");
                               String dia = (String) request.getAttribute("dia");
                               if ( dia==null )dia="1";
                               String mes = (String) request.getAttribute("mes");
                               if ( mes==null )mes="1";
                               String nombre = (String) request.getAttribute("nombre");
                               if ( nombre==null )nombre=""; 
                       %>
                       Nombre:<input type="text" class="form-control" id="nombre" value="<%=nombre%>" name="nombre"/><br>

                       Mes: <select class="form-control" name="mes" id="mes">
                       <% for( int i=0; i<meses.size(); i++){
                           String cadenaSelected = "";
                           if (Integer.parseInt(mes) == Integer.parseInt(meses.get(i))){
                               cadenaSelected = "selected";
                           }             
                       %>
                           <option value="<%=meses.get(i)%>" <%=cadenaSelected%> ><%=meses.get(i)%> </option>
                       <% } %>
                       </select><br>


                       Dia:<select class="form-control" name="dia" id="dia">
                           <% for( int d=0; d<dias.size(); d++){ 
                               String cadenaSelected = "";
                               if (Integer.parseInt( dia ) == Integer.parseInt(dias.get(d))){
                                   cadenaSelected = "selected";
                               }  
                           %>
                           <option value="<%=dias.get(d)%>" <%=cadenaSelected%> ><%=dias.get(d)%> </option>   
                        <% } %>
                       </select><br>
                       <input class="btn btn-primary" type="submit" value="Enviar">
                   </form>
                        <% String signo = (String) request.getAttribute("signo");
                        if ( signo!=null ) { %>
                        <h1 class="alert alert-success">Eres del signo: <%=signo%></h1>
                        <% } %> 
                 </div>
             </div>
         </div>
    </body>
</html>
