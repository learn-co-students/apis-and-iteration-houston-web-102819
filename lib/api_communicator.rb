require 'rest-client'
require 'json'
require 'pry'
# require 'command_line_interface.rb'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  character_name_films = nil
  response_hash["results"].each do |result|
    if result["name"] == character_name
      character_name_films = result["films"]
    end
  end
  character_name_films
  film_url_response_strings = nil
  film_url_response_hashes = []
  character_name_films.each do |film|
    film_url_response_strings = RestClient.get(film)
    film_url_response_hashes << JSON.parse(film_url_response_strings)
  end
  film_url_response_hashes
end

# p get_character_movies_from_api("Luke Skywalker")

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  movies = []
  films.each do |film|
    movies.push(film["title"])
  end
  p movies
end

# p print_movies(get_character_movies_from_api("Luke Skywalker"))

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
