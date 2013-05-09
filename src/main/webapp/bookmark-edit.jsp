<!DOCTYPE html>
<html>
<head>
<title>Bookmark - Demoiselle</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="js/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/lib/bootstrap.min.js" type="text/javascript"></script>
<script src="js/lib/persistence-service.js" type="text/javascript"></script>
<script src="js/model/bookmark.js" type="text/javascript"></script>
<script>
$(function(){
	var persistenceService = new PersistenceService("api");
	
});	
</script>
<style>
body {
	background-color: #f1f1f1;
	margin: 10px;
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