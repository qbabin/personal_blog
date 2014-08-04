# Creates new Angular module called 'Blog'
Blog = angular.module('Blog', ['ngRoute'])

# Sets up routing
Blog.config(['$routeProvider', ($routeProvider) ->
  # Route for '/post'
  $routeProvider.when('/post:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )

  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])
@IndexCtrl = ($scope, $location, $http) ->

  $scope.data = 
    posts: [{title: 'Loading posts...', contents: ''}]

  loadPosts = ->
    $http.get('./posts.json').success( (data) ->
      $scope.data.posts = data
      console.log('Successfully loaded posts.')
    ).error( ->
      console.error('Failed to load posts.')
    )

  loadPosts()

  $scope.viewPost = (postId) ->
    $location.url('/post/'+postId)
