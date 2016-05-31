class UsersController < ApplicationController
  def show
    @blogs = @user.blogs
  end
  
  def edit
  end
  
  def update
  end
end
