require 'sqlite3'
require_relative 'restaurant_reviews_database'
require_relative 'restaurant_review'

class Critic
  def self.by_id(id)
    rr_data = RestaurantReviewsDatabase.execute(<<-SQL, id)
      SELECT *
        FROM critics
       WHERE id = ?
    SQL

    Critic.new(rr_data[0])
  end

  attr_accessor :id, :screen_name

  def initialize(options)
    @id, @screen_name = options.values_at("id", "screen_name")
  end

  def reviews
    RestaurantReview.find_by_critic_id(id)
  end

  def average_review_score
    rr_data = RestaurantReviewsDatabase.get_first_value(<<-SQL, id)
      SELECT AVG(score)
        FROM restaurant_reviews
       WHERE critic_id = ?
    SQL

    # rr_data[0]

    # my_reviews = reviews
    # my_reviews.map(&:score).reduce(0, :+) / my_reviews.count.to_f
  end
end