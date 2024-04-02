  class MoviesController < ApplicationController
    def show
      @movie = Movie.find(params[:id])
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(params.require(:movie).permit(
        :title,
        :release_year,
        :synopsis,
        :country,
        :duration,
        :poster,
        :director_id,
        :genre_id,
        :release_status,
        :draft_status))

      return redirect_to movie_path(@movie.id) if @movie.save
      render :new
    end

    def edit
      @movie = Movie.find(params[:id])
    end

    def update
      return redirect_to movie_path(params[:id]) if
       Movie.find(params[:id]).update(params.require(:movie).permit(
         :title,
         :release_year,
         :synopsis,
         :country,
         :duration,
         :poster,
         :director_id,
         :genre_id,
         :release_status,
         :draft_status))

      render :edit
    end

    def publish
      movie = Movie.find(params[:id])
      movie.published!
      redirect_to movie_path(movie.id)
    end

    def turn_draft
      movie = Movie.find(params[:id])
      movie.draft!
      redirect_to movie_path(movie.id)
    end
  end