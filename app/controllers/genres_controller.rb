class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @movies_from_genre = Movie.where(genre_id: @genre.id)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params.require(:genre).permit(:name))

    return redirect_to genre_path(@genre.id) if @genre.save
    render :new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    return redirect_to genre_path(params[:id]) if
      Genre.find(params[:id]).update(params.require(:genre).permit(:name))

    render :edit
  end
end