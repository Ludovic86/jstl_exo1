<%-- 
    Document   : initProcess
    Created on : 24 sept. 2018, 15:42:48
    Author     : TA-13
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
	<body>
            <c:forEach var="parametre" items="${paramValues}">
                <ul>
                    <li><b><c:out value="${parametre.key}"/></b></li>
                    
                    <c:forEach var="value" items="${parametre.value}">
                        <c:out value="${value}"/>
                    </c:forEach>
              </ul>
            </c:forEach>
            
            <p>
	    <b>Vous vous nommez :</b>
	  </p>
	  <p>
	    <%-- Affiche les valeurs des paramètres nom et prenom en
		y accédant directement via l'objet implicite (une Map) param.
		On sait en effet qu'il n'y a qu'une valeur associée à chacun de ces 2 paramètres,
		pas besoin d'utiliser paramValues ! --%>
      	<c:out value="${ param.nom }"/> <c:out value="${ param.prenom }"/>
	  </p>

	  <p>
	    <b>Vous avez visité les pays suivants :</b>
	  </p>
	  <p>
	    <%-- Teste l'existence du paramètre pays. S'il existe on le traite, 
	    sinon on affiche un message par défaut.--%>
		<c:choose>
			<c:when test="${ !empty paramValues.pays }">
			<%-- Parcourt le tableau de valeurs associées au paramètre pays de la requête,
			   en utilisant l'objet implicite paramValues. En effet, c'est nécessaire ici puisque 
			   le select permet de renvoyer plusieurs valeurs pour le seul paramètre nommé pays. --%>
			<c:forEach var="pays" items="${ paramValues.pays }"> 
				<c:out value="${ pays }"/><br/>
			</c:forEach>
			</c:when>
			<c:otherwise>
				Vous n'avez pas visité de pays parmi la liste proposée.<br/>
			</c:otherwise>
		</c:choose>
		<%-- Teste l'existence du paramètre autre. Si des données existent on les traite, 
	    sinon on affiche un message par défaut.--%>
		<c:choose>
			<c:when test="${ !empty param.autre }">
			<%-- Parcourt les valeurs associées au paramètre autre de la requête,
			   en utilisant l'objet implicite param. En effet, toutes les valeurs sont ici concaténées 
			   et transmises dans une seule chaîne de caractères, qu'on parcourt via la boucle forTokens ! --%>
			<c:forTokens var="pays" items="${ param.autre }" delims=","> 
				<c:out value="${ pays }"/><br/>
			</c:forTokens>
			</c:when>
			<c:otherwise>
				Vous n'avez pas visité d'autre pays.<br/>
			</c:otherwise>
		</c:choose>
      </p>
            
	</body>
</html>
