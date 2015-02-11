class MoviesController < ApplicationController
  def index
    @category   = params[:category] || 'title'
    @sort_order = params[:sort_order] || 'asc'
    @search     = params[:search]
    @active     = 'movies'
    if @category || @search
      @movie = Library.movies_search_sort(@search, @category, @sort_order)
    else
      @movie = Library.all
    end
  end

  def show
    @active = 'movies'
    @search = params[:search]
    unless @search
      @movie = Library.find_by_id(params[:id].to_i)
    else
      redirect_to("/movies?search=#{ params[:search] }")
    end
  end

  def new
    @active = 'movies'
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = 'Movie was successfully created.'
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def edit
    @active = 'movies'  
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      flash[:success] = 'Item updated.'
      redirect_to movie_path(@movie.id)
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:success] = 'Item deleted.'
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :plot, :actors, :released, :genre, :trailer, :earnings)
  end
  
end