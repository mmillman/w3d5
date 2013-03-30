require 'sqlite3'
require_relative 'restaurant_reviews_database'

class RestaurantReview
  def self.find_by_critic_id(critic_id)
    rr_data = RestaurantReviewsDatabase.execute(<<-SQL, critic_id)
      SELECT *
        FROM restaurant_reviews
       WHERE critic_id = ?
    SQL

    rr_data.map { |rr_datum| RestaurantReview.new(rr_datum) }
  end

  def self.find_by_restaurant_id(restaurant_id)
    rr_data = RestaurantReviewsDatabase.execute(<<-SQL, restaurant_id)
      SELECT *
        FROM restaurant_reviews
       WHERE restaurant_id = ?
    SQL

    rr_data.map { |rr_datum| RestaurantReview.new(rr_datum) }
  end

  attr_accessor :id, :restaurant_id, :critic_id, :review, :score, :review_date

  def initialize(options)
    @id, @restaurant_id, @critic_id, @review, @score, @review_date =
      options.values_at("id", "restaurant_id", "critic_id", "review", "score", "review_date")
  end
end