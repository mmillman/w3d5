require 'sqlite3'
require_relative 'restaurant_reviews_database'

class Chef

  attr_accessor :id, :first_name, :last_name, :mentor

  def initialize(options)
    @id, @first_name, @last_name, @mentor =
      options.values_at("id", "first_name", "last_name", "mentor")
  end

  def proteges
    rr_data = RestaurantReviewsDatabase.execute(<<-SQL, id)
      SELECT *
        FROM chefs
       WHERE mentor = ?
    SQL

    rr_data.map { |rr_datum| Chef.new(rr_datum) }
  end

  def num_proteges
    RestaurantReviewsDatabase.get_first_value(<<-SQL, id)
      SELECT COUNT(*)
        FROM chefs
       WHERE mentor = ?
    SQL
  end

  def co_workers
    rr_data = RestaurantReviewsDatabase.execute(<<-SQL, id)
      SELECT chefs.*
        FROM chef_tenures my_tenures
        JOIN chef_tenures coworker_tenures
          ON my_tenures.restaurant_id = coworker_tenures.restaurant_id
        JOIN chefs
          ON coworker_tenures.chef_id = chefs.id
       WHERE my_tenures.chef_id = 6
         AND coworker_tenures.chef_id != 6
         AND my_tenures.end_date >= coworker_tenures.start_date
         AND my_tenures.start_date <= coworker_tenures.end_date
    SQL

    # Why doesn't this work?
         # AND (
         #       (right_tenures.start_date BETWEEN left_tenures.start_date AND left_tenures.end_date)
         #       OR (right_tenures.end_date BETWEEN left_tenures.start_date AND left_tenures.end_date)
         #       OR (
         #            (left_tenures.start_date BETWEEN right_tenures.start_date AND right_tenures.end_date)
         #             AND
         #            (left_tenures.end_date BETWEEN right_tenures.start_date AND right_tenures.end_date)
         #          )
         #     )
    rr_data.map { |rr_datum| Chef.new(rr_datum) }
  end
end