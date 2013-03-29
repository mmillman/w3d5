require 'singleton'
require 'sqlite3'

class RestaurantReviewDatabase < SQLite3::Database

  include 'singleton'

  def initialize()
    super('rr_database.db')

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end

end