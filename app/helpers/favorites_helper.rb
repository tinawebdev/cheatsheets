module FavoritesHelper
  def add_or_remove_favorite(cheatsheet, styles: "")
    icon_bookmark_filled = content_tag(:i, '', class: "fas fa-bookmark")
    icon_bookmark_empty = content_tag(:i, '', class: "far fa-bookmark")

    if current_user 
      if current_user.favorited_cheatsheets.exists?(cheatsheet.id)
        link_to favorite_path(cheatsheet), method: :delete, class: styles do
          content_tag(:span, icon_bookmark_filled, class: "icon is-small has-text-danger")
        end
      else
        link_to favorites_path(cheatsheet_id: cheatsheet), method: :post, class: styles do
          content_tag(:span, icon_bookmark_empty, class: "bookmark_empty icon is-small")
        end
      end
    end
  end
end
