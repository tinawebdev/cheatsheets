module UsersHelper
  def gravatar_for(user, size: "120")
    hash = Digest::MD5::hexdigest(user.email.downcase)
    image_src = "https://secure.gravatar.com/avatar/#{hash}?d=monsterid&s=#{size}"
    image_tag(image_src, alt: user.name, class: "user_avatar mb-2")
  end

  def has_name?(user, style="has-text-danger")
    if (user.name.present?)
      name = content_tag(:span, "#{user.name} ", class: style)
      slash = content_tag(:span, "/", class: "has-text-light")
      name + slash
    end
  end
end
