module BloggerHelper
  def random_color
    color = [:green, :red, :pink, :purple, :cyan, :indigo, :blue, :yellow, :orange, :brown, :teal].shuffle.sample
    return color
  end
end
