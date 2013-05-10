<!DOCTYPE html>
<html>
<head>
<title>Bookmark - Demoiselle</title>
<base href="http://localhost:8080/servlet/home">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="js/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/lib/bootstrap.min.js" type="text/javascript"></script>
<script src="js/lib/jquery.dataTables.min.js" type="text/javascript"></script>
<style>
	body {
		margin: 10px;
		background-color:#f1f1f1;
	}
	
	#welcome{
		background: #ffffff;
		border: 1px solid #a8a8a8;
		border-radius: 3px;
		color: #4f4f4f;
		font-family: Arial,sans-serif;
		font-size: 1.1em;
		-webkit-border-radius: 3px;
		-moz-border-radius: 3px;
		padding: 1em;
	}
</style>
</head>
<body>

	<jsp:include page="menu.jsp" />

	<div id="welcome">
		Bem-vindo à aplicação de exemplo Bookmark sem JSF e JPA. Este é o seu ponto de partida, portanto sinta-se à vontade para modificar esta aplicação.
	</div>

</body>
</html>