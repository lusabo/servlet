var PersistenceService = function(baseUrl) {
	this.url = baseUrl;
	return this;
};

PersistenceService.prototype.create = function(type, data, callback) {
};

PersistenceService.prototype.get = function(type, callback) {
};

PersistenceService.prototype.update = function(type, data, callback) {
	$.ajax({
		type : "PUT",
		url : this.url + "/" + type + "/" + data.id,
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf8",
		dataType : "json",
		success : function(respData) {
			if (callback) {
				callback(respData);
			}
		}
	});
};

PersistenceService.prototype.remove = function(type, id, callback) {
	$.ajax({
		type : "DELETE",
		url : this.url + "/" + type + "/" + id,
		contentType : "application/json;charset=utf8",
		dataType : "json",
		success : function(respData) {
			if (callback) {
				callback(respData);
			}
		}
	});	
};
