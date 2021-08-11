class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "Se ha creado una nueva publicación."
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Se ha editado la publicación correctamente."
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :rich_description, :category, photos: [])
  end
end
