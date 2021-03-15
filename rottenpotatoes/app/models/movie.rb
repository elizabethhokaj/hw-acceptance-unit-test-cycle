class Movie < ActiveRecord::Base
  
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def change
    add_column :movies, :director, :string
  end
  
  def self.similar(id)
    director = Movie.find(id).director
    self.where(director: director)
  end
  
  
end
