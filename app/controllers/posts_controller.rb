class PostsController < ApplicationController
respond_to :json

def index
	#gathers all the post data
	posts = Post.all

	#responds to request in json format
	respond_with(posts) do |format|
		format.json { render :json => posts.as_json }
	end
end

end
