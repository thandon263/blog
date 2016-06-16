class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to "/articles"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_url
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to '/articles'
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :body)
  end

end
