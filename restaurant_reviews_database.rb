require 'sqlite3'
require 'singleton'

class RestaurantReviewsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('rr_database.db')

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end

  def self.get_first_value(*args)
    self.instance.get_first_value(*args)
  end
end