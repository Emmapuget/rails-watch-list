require 'json'
require 'open-uri'
url = 'https://tmdb.lewagon.com/movie/top_rated?page=1'

counter = 0
Bookmark.destroy_all
Movie.destroy_all

20.times do
  serialized_movies = URI.open(url).read
  movies = JSON.parse(serialized_movies)
  p movies['results'][counter]['original_title']
  Movie.create!(title: movies['results'][counter]['original_title'], overview: movies['results'][counter]['overview'], poster_url: "https://image.tmdb.org/t/p/original/#{movies['results'][counter]['poster_path']}", rating: movies['results'][counter]['vote_average'])
  counter += 1
end
