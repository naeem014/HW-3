class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date, @all_ratings
  def rate
    @all_ratings = Array['G', 'PG', 'PG-13', 'R']
  end
end
