class BloggerController < ApplicationController
  def index
    @bloggers = User.all.reverse
  end
end
