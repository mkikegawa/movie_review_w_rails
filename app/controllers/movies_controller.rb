class MoviesController < ApplicationController
  def index
    @category   = params[:category] || 'title'
    @sort_order = params[:sort_order] || 'asc'
    @search     = params[:search]
    @active     = 'movies'
    if @category || @search
      @library = Library.movies_search_sort(@search, @category, @sort_order)
    else
      @library = Library.all
    end
  end

  def show
    @active = 'movies'
    @search = params[:search]
    if !@search
      @movie = Library.find_by_id(params[:id].to_i)
    else
      redirect to("/movies?search=#{ @search }")
    end
  end
end