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
end
