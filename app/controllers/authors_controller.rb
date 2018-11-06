class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end
  def create
    @author = Author.new(author_params)

    if @author.save && !@author.errors.any?
      redirect_to @author
    else
      render "new"
    end
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
