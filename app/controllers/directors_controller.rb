class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    @movies_from_director = Movie.where(director: @director.id)
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(params.require(:director)
      .permit(:name, :nationality, :birth_date, :genre_id))

    return redirect_to director_path(@director.id) if @director.save
    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    return redirect_to director_path(params[:id]) if
      Director.find(params[:id])
        .update(params.require(:director)
        .permit(:name, :nationality, :birth_date, :genre_id))

    render :edit
  end
end