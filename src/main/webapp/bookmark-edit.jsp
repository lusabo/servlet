<!DOCTYPE html>
<html>
<head>
<title>Bookmark - Demoiselle</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>

<style>
body {
	margin: 10px;
	background-color: #f1f1f1;
}

#welcome {
	background: #ffffff;
	border: 1px solid #a8a8a8;
	border-radius: 3px;
	color: #4f4f4f;
	font-family: Arial, sans-serif;
	font-size: 1.1em;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	padding: 1em;
}
</style>
</head>
<body>

	<jsp:include page="menu.jsp" />
	<form class="form-horizontal">
		<fieldset>
			<legend>Bookmark</legend>
			<div class="control-group">
				<label class="control-label">ID</label>
			</div>			
			<div class="control-group">
				<label class="control-label" for="description">Description</label>
				<div class="controls">
					<input type="text" id="description">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="link">Link</label>
				<div class="controls">
					<input type="text" id="link">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn">Salvar</button>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>