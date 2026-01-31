class CategoriesController < ApplicationController
  before_action :set_genre
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = @genre.categories
  end

  def show
    @genre = Genre.find(params[:genre_id])
    @category = @genre.categories.find(params[:id])
    @items = @category.items
  end

  def new
    @category = @genre.categories.build
  end

  def create
    @category = @genre.categories.build(category_params)
    if @category.save
      redirect_to [@genre, @category], notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to [@genre, @category], notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to genre_categories_url(@genre), notice: 'Category was successfully destroyed.'
  end

  private

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

  def set_category
    @category = @genre.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
