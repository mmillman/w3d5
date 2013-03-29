require 'sqlite3'
require 'singleton'

class RestaurantReviewDatabase < SQLite3::Database

  include Singleton

  def initialize
    super('rr_database.db')

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end

end