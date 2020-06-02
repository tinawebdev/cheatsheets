module CheatsheetsHelper
  def created_tag(cheatsheet)
    content_tag(:span, "Created: #{cheatsheet.created_at.strftime("%B %d, %Y")}", class: "tag #{created_tag_color(cheatsheet)}")
  end

  def created_tag_color(cheatsheet)
    cheatsheet.recently_created? ? 'is-info' : 'is-dark'
  end

  def updated_tag(cheatsheet)
    if cheatsheet.recently_updated?
      content_tag(:span, "Updated: #{cheatsheet.updated_at.strftime("%B %d, %Y")}", class: "tag is-info")
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
