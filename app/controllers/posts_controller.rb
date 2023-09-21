class PostsController < ApplicationController
  def index
    render json:
      [
        idd: 1,
        title: 'Post 1'
      ]
  end
end
