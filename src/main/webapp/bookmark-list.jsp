<!DOCTYPE html>
<html>
<head>
<title>Bookmark - Demoiselle</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" type="text/css" />
<link href="css/DT_bootstrap.css" rel="stylesheet" type="text/css">

<script src="js/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/lib/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="js/lib/bootstrap.min.js" type="text/javascript"></script>
<script src="js/lib/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="js/lib/DT_bootstrap.js" type="text/javascript"></script>
<script>
	function drawTable(data){
		var oTable = $('#table-bookmarks').dataTable({
			"bRetrieve": true,
			"bFilter": false,
		  "bLengthChange": false,
    	"aoColumns": [
										{ "aTargets" : [0], 
											"sWidth" : "20px",
											"mData" : "id", 
											"bSortable" : false,
											"mRender" : function ( data ) {
													return '<input type="checkbox" id="del-' + data + '" name="del-' + data + '" value="' + data + '"/>';
											}
 										},    	          	
    	              { "aTargets" : [1], "mData" : "id", "sTitle" : "ID"  },
    	              { "aTargets" : [2], "mData" : "description", "sTitle" : "DESCRIÇÃO"  },
    	              { "aTargets" : [3], "mData" : "link", "sTitle" : "LINK"  }
    	          	 ],
			"sPaginationType": "bootstrap",
			"oLanguage" : {
				"sEmptyTable": "Nenhum registro retornado.",
				"sZeroRecords" : "Nenhum registro retornado.",
				"sProcessing" : "Carregando ...",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ registros",
				"oPaginate" : {
					"sNext" : "",
					"sPrevious" : ""
				}
			},
			"sDom": '<"H"<"toolbar">r>t<"F"ip>'
		});
		
		$("div.toolbar").replaceWith('<div id="toolbar" class="well well-small btn-toolbar"><button id="new"><i class="icon-file"></i></button><button id="delete"><i class="icon-trash"></i></button></div>');
		$("#new").on("click", function(e){ _new('bookmark-edit'); });
		$("#delete").on("click", function(e){ $( "#dialog-delete" ).dialog( "open" ); });		
	 	oTable.fnClearTable();
		oTable.fnAddData(data);
	}


	function _initTable(){
		$.ajax({
			  dataType: "json",
			  url: "api/bookmarks",
			  success: function(data){
				  drawTable(data);
				}
		});
	}
	
	function _new(_destination){
		location.href = _destination;
	}

	function _delete(){
		$(":checked").each(function( index ){
			var _id = this.value;
			$.ajax({
				type: "DELETE",
				url: "api/bookmarks/" + _id,
				success: function(data){
					console.log(_id + " removido com sucesso.");
				}
			});
		});
		_initTable();
	}
	
	$(function(){
		
		$( "#dialog-delete" ).dialog({
			autoOpen: false,
			buttons: [ 
						{ text: "Sim, claro!", 
							click: 	function() {
								_delete();
								$( this ).dialog( "close" ); 
							} 
						},
						{ text: "Não, desculpe!", 
							click: 	function() { 
								$( this ).dialog( "close" ); 
							} 
						} 
			],					
		  height: 176,
		  width: 272,
		  modal: true,
			title: 'Alerta!'
		});
		
		_initTable();

	});
</script>
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
	
div.dataTables_paginate {
    float: right;
    margin: 0;
}
</style>
</head>
<body>
<jsp:include page="menu.jsp" />
<table id="table-bookmarks" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"></table>
<div id="dialog-delete"><br/><i class="icon-warning-sign"></i>&nbsp;Confirma?</div>
</body>
</html>