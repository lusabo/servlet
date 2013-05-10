var PersistenceService = function(baseUrl) {
	this.url = baseUrl;
	return this;
};

PersistenceService.prototype.create = function(type, data, callback) {
	return $.ajax({
		type : "POST",
		url : this.url + "/" + type,
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

PersistenceService.prototype.update = function(type, data, callback) {
	return $.ajax({
		type : "PUT",
		url : this.url + "/" + type,
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

PersistenceService.prototype.get = function(type, id, callback) {
	return $.ajax({
		type : "GET",
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

PersistenceService.prototype.all = function(type, callback) {
	return $.ajax({
		type : "GET",
		url : this.url + "/" + type,
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
	return $.ajax({
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
