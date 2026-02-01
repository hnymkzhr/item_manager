class CategoriesController < ApplicationController
  before_action :set_genre
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @categories = @genre.categories
    else
      @categories = Category.all.includes(:genre)
    end
  end

  def new
    @category = @genre.categories.build
  end

  def create
    @category = @genre.categories.build(category_params)
    if @category.save
      redirect_to genre_categories_path(@genre), notice: 'カテゴリーが正常に作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to genre_categories_path(@genre), notice: 'カテゴリーが正常に更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to genre_categories_url(@genre), notice: 'カテゴリーが正常に削除されました。'
  end

  private

  def set_genre
    @genre = Genre.find(params[:genre_id]) if params[:genre_id]
  end

  def set_category
    @category = @genre.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
