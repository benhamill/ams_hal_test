class AuthorsController < ApplicationController
  def index
    render hal: Author.order('created_at DESC')
  end

  def show
    render hal: Author.find(params[:id])
  end
end
