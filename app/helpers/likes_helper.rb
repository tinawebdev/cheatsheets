module LikesHelper
  def like_or_unlike_button(cheatsheet, like, styles="button is-dark is-small")
    icon_heart_filled = content_tag(:i, '', class: "fas fa-heart")
    icon_heart_empty = content_tag(:i, '', class: "far fa-heart")

    if like
      link_to cheatsheet_like_path(cheatsheet, like), method: :delete, class: styles do
        content_tag(:span, icon_heart_filled, class: "icon has-text-danger")
      end
    else
      link_to cheatsheet_likes_path(cheatsheet), method: :post, class: styles do
        content_tag(:span, icon_heart_empty, class: "icon has-text-grey")
      end
    end
  end
end
