module CheatsheetsHelper
  def is_updated?(cheatsheet)
    if cheatsheet.updated_at > cheatsheet.created_at
      content_tag(:span, "Updated: #{cheatsheet.updated_at.strftime("%B %d, %Y")}", class: "tag is-dark")
    end
  end
end
