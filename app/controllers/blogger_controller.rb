class BloggerController < ApplicationController
  def index
    @bloggers = User.all
  end
end
