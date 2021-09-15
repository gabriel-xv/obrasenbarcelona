class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @items = @article.items
  end

  def new
    @article = Article.new
    @article.items.build
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @edit_article = Article.find(params[:id])
  end

  def update
    @update_article = Article.find(params[:id])
    if @update_article.update(article_params)
      redirect_to article_path(@update_article)
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :category, photos: [], items_attributes: [:id, :title, :comment, :photo, :_destroy])
  end
end
