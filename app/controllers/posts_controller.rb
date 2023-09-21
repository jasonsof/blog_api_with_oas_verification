class PostsController < ApplicationController
  def index
    render json: {
      posts: [
        {
          id: 1,
          title: 'Post 1'
        }
      ]
    }
  end
end
