class ItemsController < ApplicationController
  before_action :set_genre
  before_action :set_category
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @category.items
  end

  def show
  end

  def new
    @item = @category.items.build
  end

  def create
    @item = @category.items.build(item_params)
    if @item.save
      redirect_to [@genre, @category, @item], notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to [@genre, @category, @item], notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to genre_category_items_url(@genre, @category), notice: 'Item was successfully destroyed.'
  end

  private

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

  def set_category
    @category = @genre.categories.find(params[:category_id])
  end

  def set_item
    @item = @category.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
