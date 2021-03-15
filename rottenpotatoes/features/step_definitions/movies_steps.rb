Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  movie_id = Movie.find_by(title: arg1) 
  visit movie_path(movie_id) #visit movie details page
  expect(page.body).to match(/Director:\s*#{arg2}/)
  #match movie detail view for director to Director: arg2
end  
  
end
