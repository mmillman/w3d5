require 'sqlite3'
require_relative 'restaurant_reviews_database'

class Restaurant

  def initialize(options)
    @id, @name, @neighborhood, @cuisine =
      options.values_at("id", "name", "neighborhood", "cuisine")
  end

  def self.by_neighborhood(neighborhood)
    rr_data = RestaurantReviewsDatabase.execute(<<-SQL, neighborhood)
      SELECT *
        FROM restaurants
       WHERE neighborhood = ?
    SQL

    rr_data.map { |rr_datum| Restaurant.new(rr_datum) }
  end

  def reviews
  end

  def average_review_score
  end

end