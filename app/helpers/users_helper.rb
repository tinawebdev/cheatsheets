module UsersHelper
  def has_name?(user, style="has-text-danger")
    if (user.name.present?)
      name = content_tag(:span, "#{user.name} ", class: style)
      slash = content_tag(:span, "/", class: "has-text-light")
      name + slash
    end
  end
end
