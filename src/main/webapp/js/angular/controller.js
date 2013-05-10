function WelcomeCtrl($scope) {
	$scope.mensagem = "Bem-vindo à aplicação de exemplo Bookmark sem JSF e JPA. Este é o seu ponto de partida, portanto sinta-se à vontade para modificar esta aplicação."
}
function BookMarkCtrl($scope, $rootScope, $routeParams, $location, bookmarkStorage, $dialog) {

	// Inlined template for demo
  var t = '';

	 $scope.dialogOpts = {
	    backdrop: true,
	    keyboard: true,
	    backdropClick: true,
	    //template:  t, // OR: templateUrl: 'path/to/view.html',
	    templateUrl: 'dialog-confirm.html',
	    controller: 'ConfirmDialogController'
	  };

	$rootScope.bookmarks = bookmarkStorage.BookMarkResource.query();

	$scope.delete = function(bookmark) {
		var d = $dialog.dialog($scope.dialogOpts);
	    d.open().then(function(result){
	      if(result)
	      {
	        bookmarkStorage.BookMarkResource.remove({id: bookmark.id},function() {
				$rootScope.bookmarks = bookmarkStorage.BookMarkResource.query();
			});
	      }
	    });
	}
}

// the dialog is injected in the specified controller
function ConfirmDialogController($scope, dialog){
  $scope.close = function(result){
    dialog.close(result);
  };
}

function BookMarkEditCtrl($scope, $rootScope, $routeParams, bookmarkStorage,$location) {
	function loadBookMark() {
		$scope.bookmark = {
                id: null,
                description: '',
                link: ''
        };
		for(i=0; i < $rootScope.bookmarks.length; i++)
		{
			if($rootScope.bookmarks[i].id == $routeParams.id)
			{
				$scope.bookmark = $rootScope.bookmarks[i];
			}
		}
	}
	if($rootScope.bookmarks == undefined) {
		 bookmarkStorage.BookMarkResource.query(function(data) {
             $rootScope.bookmarks = data;
             loadBookMark();
           } );
	}
	else {
		loadBookMark();
	}

    $scope.salvar = function() {
        if($scope.bookmark.id == null) {
            bookmark_novo = new bookmarkStorage.BookMarkResource($scope.bookmark);
            bookmark_novo .$save(function(){
                 $location.path('bookmark-list');
            });
        } else {
            $scope.bookmark.$update(function(){
                $location.path('bookmark-list');
            });
        }
	}
}