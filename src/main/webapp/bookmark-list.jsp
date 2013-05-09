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
<script src="js/lib/persistence-service.js" type="text/javascript" ></script>

<script>
	var persistenceService = new PersistenceService("api");

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
													return '<a href="#" class="remove" id="' + data + '" ><i class="icon-trash"></i></a>';
											}
 										},    	          	
    	              { "aTargets" : [1], "mData" : "id", "sTitle" : "Id",
 						    	    "mRender" : function ( data ) {
 	 						    	    return '<a href="bookmark-edit/' + data + '">' + data + '</a>';
 	 						    	  }
 	 	 						    },
    	              { "aTargets" : [2], "mData" : "description", "sTitle" : "Descrição"  },
    	              { "aTargets" : [3], "mData" : "link", "sTitle" : "Link"  }
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
		
		$("div.toolbar").replaceWith('<div id="toolbar" class="well well-small btn-toolbar"><button id="new"><i class="icon-file"></i></button>');
		$("#new").on("click", function(e){ _new('bookmark-new'); });
	 	oTable.fnClearTable();
		oTable.fnAddData(data);
	}
	
	function _new(_destination){
		location.href = _destination;
	}

	function _remove(_id){
		$( "#dialog-delete" ).dialog("open").dialog({
			buttons: [ 
						{ text: "Sim, claro!", 
							click: 	function() {
								$.when(
										persistenceService.remove("bookmark", _id) 
								).done(function(){
										persistenceService.all("bookmark", drawTable);	
								});
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
	}

	$(function(){
		$( "#dialog-delete" ).dialog({autoOpen: false});
		
		persistenceService.all("bookmark", drawTable);

		$("#table-bookmarks").delegate("a.remove", "click", function () {
			_remove(this.id);
	  });	

		
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