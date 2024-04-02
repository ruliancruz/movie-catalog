class HomeController < ApplicationController
  def index
    @released_movies = Movie.published.released
    @not_released_movies = Movie.published.not_released
  end
end