class AuthorsController < ApplicationController
  def index
    render hal: Author.order('created_at DESC')
  end
end
