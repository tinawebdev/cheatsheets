module SubscriptionsHelper
  def user_feed
    cheatsheets = []
    @subscriptions.shuffle.map do |tag|
      tag.cheatsheets.public_cheatsheets.each do |cheatsheet|
        unless cheatsheets.include?(cheatsheet)
          cheatsheets << cheatsheet
        end
      end
    end

    cheatsheets
  end
end
