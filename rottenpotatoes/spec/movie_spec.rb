require 'rails_helper'

describe Movie do
  describe "#similar_movies"  do
    it "should find movies with the same director" do
      movie1 = Movie.create! :director => "Director 1"
      movie2 = Movie.create! :director => "Director 1"
      expect(Movie.similar_movies(movie1.id)).to include(movie2)
    end
    it "should not find movies with different directors" do
      movie1 = Movie.create! :director => "Director 1"
      movie2 = Movie.create! :director => "Director 2"
      expect(Movie.similar(movie1.id)).to_not include(movie2)
    end
  end

  describe 'Returns all ratings:' do
        it 'returns all ratings' do
           expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
        end
   end
end 
