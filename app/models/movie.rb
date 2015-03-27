class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date, @all_ratings
  def rate
    @all_ratings = {'G'=>true, 'PG'=>true, 'PG-13'=>true, 'R'=>true}
  end
end
