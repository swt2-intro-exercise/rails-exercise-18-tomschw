class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
  end

  def create
    @author = Author.create(author_params)
    redirect_to @author
  end

  def show
    @author = Author.find(params[:id])
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
