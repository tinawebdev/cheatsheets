module PagesHelper
  def is_main_tag?(hashtag)
    Tag::MAIN_TAGS.include?(hashtag.name)
  end
end
