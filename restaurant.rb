require 'sqlite3'
require_relative 'restaurant_review_database'

class Restaurant

  def initialize(options)
    @id, @name, @neighborhood, @cuisine =
      options.values_at("id", "name", "neighborhood", "cuisine")
  end

  def self.by_neighborhood(neighborhood)
    rr_data = RestaurantReviewDatabase.execute(<<-SQL, neighborhood)
      SELECT *
        FROM restaurants
       WHERE neighborhood = ?
    SQL

    rr_data.map { |result| Restaurant.new(result) }
  end

  def reviews
  end

  def average_review_score
  end

end