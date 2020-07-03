module CheatsheetsHelper
  def created_tag(cheatsheet)
    if cheatsheet.recently_created?
      content_tag(:span, "Created: #{distance_of_time_in_words(Time.now, cheatsheet.created_at)} ago", class: "tag is-info")
    else
      content_tag(:span, "Created: #{cheatsheet.created_at.strftime("%B %d, %Y")}", class: "tag is-dark")
    end
  end

  def updated_tag(cheatsheet)
    if cheatsheet.updated_at > cheatsheet.created_at && !cheatsheet.recently_created?
      if cheatsheet.recently_updated?
        content_tag(:span, "Updated: #{distance_of_time_in_words(Time.now, cheatsheet.updated_at)} ago", class: "tag is-info")
      else
        content_tag(:span, "Updated: #{cheatsheet.updated_at.strftime("%B %d, %Y")}", class: "tag is-dark")
      end
    end
  end

  def visibility(cheatsheet)
    if cheatsheet.public
      content_tag(:span, "Public", class: "tag is-medium")
    else
      content_tag(:span, "Private", class: "tag is-warning is-medium")
    end
  end
 
  def change_hashtag_to_link(hashtag, style)
    tag = Tag.find_by(name: hashtag.downcase)
    hashtag.gsub!(hashtag, link_to(hashtag, tag_path(tag), class: style))

    hashtag.html_safe
  end

  def likes_count(cheatsheet)
    likes_count = cheatsheet.likers.count
    counter = content_tag(:span, likes_count, class: "has-text-grey mr-2", style: "cursor: default")

    icon_heart_filled = content_tag(:i, '', class: "fas fa-heart")
    icon_heart_empty = content_tag(:i, '', class: "far fa-heart")

    if current_user && current_user.liked_cheatsheets.exists?(cheatsheet.id)
      content_tag(:span, icon_heart_filled, class: "icon has-text-danger") + counter
    else
      content_tag(:span, icon_heart_empty, class: "icon has-text-grey") + counter
    end
  end
end
