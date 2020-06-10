module FavoritesHelper
  def add_or_remove(cheatsheet)
      icon = content_tag(:i, class: "far fa-bookmark")
      span = content_tag(:span, icon, class: "icon is-small has-text-grey")
      link_to span, favorites_path(cheatsheet_id: cheatsheet), method: :post, class: "navbar-item #{current_class?(favorites_path)}"

  end
end

