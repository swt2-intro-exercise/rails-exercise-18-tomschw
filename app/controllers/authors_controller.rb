class AuthorsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @author = Author.create(author_params)
  end

  def show
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
