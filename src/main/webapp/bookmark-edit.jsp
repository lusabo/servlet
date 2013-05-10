<!DOCTYPE html>
<html>
<head>
<title>Bookmark - Demoiselle</title>
<base href="http://localhost:8080/servlet/bookmark-edit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="js/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/lib/bootstrap.min.js" type="text/javascript"></script>
<script src="js/lib/persistence-service.js" type="text/javascript"></script>
<script src="js/model/bookmark.js" type="text/javascript"></script>


<script>
function fillForm(data){
	$("#id").val(data.id);
	$("#description").val(data.description);
	$("#link").val(data.link);
}

$(function(){
	var id = <%= request.getParameter("id") %>;
	var persistenceService = new PersistenceService("api");

	persistenceService.get("bookmark", id, fillForm); 

	$("#salvar").click(function(){
		
		var bookmark = new Bookmark();
		bookmark.id = $("#id").val();
		bookmark.description = $("#description").val();
		bookmark.link = $("#link").val();

		$.when(
				persistenceService.update("bookmark", bookmark) 
		).done(function(){
			location.href = "bookmark-list";
		});
		
	});	
	
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
				<div class="controls">
					<input type="text" id="id" readonly="readonly">
				</div> 
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
					<button id="salvar" type="button" class="btn">Salvar</button>
				</div>
			</div>
		</fieldset>			
	</form>
</body>
</html>