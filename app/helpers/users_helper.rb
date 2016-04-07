module UsersHelper
  def gravatar_large_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=200"
    image_tag(gravatar_url, alt: user.name, class: "user-avatar circle responsive-img")
  end

  def gravatar_thumbnail_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=50"
    image_tag(gravatar_url, alt: user.name, class: "circle responsive-img")
  end

end
