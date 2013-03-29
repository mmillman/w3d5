require 'sqlite3'
require_relative 'restaurant_reviews_database'
require_relative 'restaurant_review'

class Critic

  def initialize(options)
    @id, @screen_name = options.values_at("id", "screen_name")
  end

  def reviews
    RestaurantReview.find_by_critic_id(self.id)
  end

  def average_review_score
  end

end