require 'sqlite3'
require_relative 'restaurant_reviews_database'
require_relative 'restaurant_review'

class Restaurant
  def self.by_neighborhood(neighborhood)
    rr_data = RestaurantReviewsDatabase.execute(<<-SQL, neighborhood)
      SELECT *
        FROM restaurants
       WHERE neighborhood = ?
    SQL

    rr_data.map { |rr_datum| Restaurant.new(rr_datum) }
  end

  attr_accessor :id, :name, :neighborhood, :cuisine

  def initialize(options)
    @id, @name, @neighborhood, @cuisine =
      options.values_at("id", "name", "neighborhood", "cuisine")
  end

  def reviews
    RestaurantReview.find_by_restaurant_id(id)
  end

  def average_review_score
    rr_data = RestaurantReviewsDatabase.execute(<<-SQL, id)
      SELECT AVG(score)
        FROM restaurant_reviews
       WHERE restaurant_id = ?
    SQL

    rr_data[0]

    # my_reviews = reviews
    # my_reviews.map(&:score).reduce(0, :+) / my_reviews.count.to_f
  end
end