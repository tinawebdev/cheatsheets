module CheatsheetsHelper
  def created_tag(cheatsheet)
    content_tag(:span, "Created: #{cheatsheet.created_at.strftime("%B %d, %Y")}", class: "tag #{created_tag_color(cheatsheet)}")
  end

  def updated_tag(cheatsheet)
    if cheatsheet.updated_at > cheatsheet.created_at
      content_tag(:span, "Updated: #{cheatsheet.updated_at.strftime("%B %d, %Y")}", class: "tag #{updated_tag_color(cheatsheet)}")
    end
  end

  def created_tag_color(cheatsheet)
    cheatsheet.recently_created ? 'is-success' : 'is-dark'
  end

  def updated_tag_color(cheatsheet)
    cheatsheet.recently_updated ? 'is-success' : 'is-dark'
  end

  def visibility(cheatsheet)
    if cheatsheet.public
      content_tag(:span, "Public", class: "tag is-medium")
    else
      content_tag(:span, "Private", class: "tag is-warning is-medium")
    end
  end
end
