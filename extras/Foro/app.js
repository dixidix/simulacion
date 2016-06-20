var cscw = angular.module('cscw', ['ui.materialize','ui.router']);

cscw.config(function($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise("/");
	$stateProvider
	.state('home', {url: "/", templateUrl: "./views/home/home.template.html", controller:"homeCtrl"})
	.state('posts', {url: "/posts", templateUrl: "./views/posts/posts.template.html", controller:"myPostsCtrl"})
	.state('messages', {url: "/messages",  templateUrl: "./views/msg/msg.template.html", controller:"myMsgCtrl"});
});

cscw.controller('mainController', function($scope,$http,$window){
	$scope.user = {
		username: '',
		password:''
	};
	$scope.clearStorage = function(){
		sessionStorage.clear();
	}
	if(sessionStorage.getItem("user")){
		$scope.showUser = true;
		var user = JSON.parse(sessionStorage.getItem("user"));
		if(user[0].firstname){
			$scope.userLogged = user[0].firstname;
		}
	} else {
		$scope.showUser = false;
	}
	$http.get('./php/get_actives.php').then(function success(response){
		$scope.usersActives = response.data || [];
	},
	function onError(error){
		console.log(error);
	});

	$scope.logIn = login;
	$scope.setCurrentUser = function (userLogin){		
		$http.get('./php/login.php', {params:{ username: userLogin.username, password: userLogin.password }}).then(function success(response){
			if(response.data.length){
				sessionStorage.user = JSON.stringify(response.data);
			}
		});
	}
});
cscw.controller('homeCtrl', function($scope,$http){
	if(sessionStorage.getItem("user")!== null){
		$scope.isLogged = true;
	}else{
		$scope.isLogged = false;
	}
	$http.get('./php/get_post.php').then(function success(response){
		$scope.posts = response.data || [];
	},
	function onError(error){
		console.log(error);
	});
	$scope.setPost = setPost;
	function setPost(post){
		$scope.viewPost = post;
	}
});
cscw.controller('myMsgCtrl', function($scope, $http, $state){

	$scope.sendMail = sendMail;
	$scope.deleteMail = deleteMail;
	var user = JSON.parse(sessionStorage.getItem("user"));
	$http.get('./php/get_messages.php', {params:{ userid: user[0].id }})
	.then(function success(response){
		$scope.emails = response.data;
	},
	function onError(error){
		console.log(error);
	});
	function deleteMail(emailId){
		console.log(emailId);
		$http({
			url:'./php/delete_message.php',
			method: "POST",
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data: $.param({ 
				id: emailId
			})
		}).success(function(data, status, headers, config) {
			$state.go($state.current, {}, {reload: true});
		}).error(function(data, status, headers, config) {
			$scope.status = status;
		});	
	}
	function sendMail(email){
		$http.get('./php/get_users.php').then(function success(response){
			$scope.users = response.data || [];
		},
		function onError(error){
			console.log(error);
		});
		$scope.emailContext = {
			to:'',
			from:'',
			subject: '',
			fullmessage: ''
		}
		if(email){
			console.log(email);
			$scope.emailContext.to = email.useridfrom;
			$scope.emailContext.subject = "RE: " + email.subject;
			$scope.emailContext.from = JSON.parse(sessionStorage.getItem("user"))[0].id;
			$scope.emailContext.fullmessage = "";
		} else {
			$scope.emailContext.subject = '';
			$scope.emailContext.to = "";
			$scope.emailContext.from = JSON.parse(sessionStorage.getItem("user"))[0].id;
			$scope.emailContext.fullmessage = "";
		}
	}
	$scope.send = function send(emailToSend){
		$http({
			url:'./php/send_messages.php',
			method: "POST",
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data: $.param({ 
				from: emailToSend.from,
				to: angular.element('select option:selected').val(),
				subject:emailToSend.subject,
				fullmessage:emailToSend.fullmessage 
			})
		}).success(function(data, status, headers, config) {
			$scope.data = data;
		}).error(function(data, status, headers, config) {
			$scope.status = status;
		});
	}
});
cscw.controller('myPostsCtrl', function($scope, $http, uploadService, $state){
	$scope.file = {
		ownerId: '',
		created:'',
		title:'',
		detail:'',
		filepost:'',
	};
	$scope.getFile = function(file){
		console.log(file);
		$http.get('./php/get_file.php', {params:{ path: file.filepath, filename: file.filename ,id: file.ownerId }}).then(function success(response){
			  window.open('/foro/' + file.filepath, '_self');
		},
		function onError(error){
			console.log(error);
		});
	}
	$scope.deletePost = function(postId){
		console.log(postId);
		$http({
			url:'./php/delete_post.php',
			method: "POST",
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data: $.param({ 
				id: postId
			})
		}).success(function(data, status, headers, config) {
			$state.go($state.current, {}, {reload: true});
		}).error(function(data, status, headers, config) {
			$scope.status = status;
		});	
	}
	$http.get('./php/get_userPost.php', {params:{ userid: JSON.parse(sessionStorage.getItem("user"))[0].id }}).then(function success(response){
		$scope.ownerPost = response.data || [];
	},
	function onError(error){
		console.log(error);
	});
	$scope.savePost = function(file){
		$scope.file.ownerId = JSON.parse(sessionStorage.getItem("user"))[0].id;
		$scope.file.created  = (new Date).getTime();
		console.log($scope.file);
		uploadService.uploadFile($scope.file).then(function (res) {
			$state.go($state.current, {}, {
				reload: true
			});
		});
	}

});
cscw.directive('uploaderModel', ["$parse", function ($parse) {
	'use strict';
	return {
		restrict: 'A',
		link: function (scope, iElement, iAttrs) {
			iElement.on("change", function (e) {
				$parse(iAttrs.uploaderModel).assign(scope, iElement[0].files[0]);
			});
		}
	};
}]);
cscw.service('uploadService', ["$http", "$q", function ($http, $q) {
	this.uploadFile = function (post) {
		var deferred = $q.defer();
		var formData = new FormData();
		formData.append("ownerId", post.ownerId);
		formData.append("title", post.title);
		formData.append("detail", post.detail);
		formData.append("filepost", post.filepost);
		formData.append("created", post.created);
		return $http.post("./php/add_post.php", formData, {
			transformRequest: angular.identity,
			headers: {'Content-Type': undefined}
		}).success(function (res) {
			deferred.resolve(res);
		}).error(function (msg, code) {
			deferred.reject(msg);
		});
		return deferred.promise;
	};
}]);