class ArticlesController < ApplicationController
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
    @article = Article.create(article_params)
    if 
    article_params[:title].empty?
    redirect_to new_article_path, notice: 'Please supply a title'
    elsif  
    article_params[:content].empty?
    redirect_to root_path, notice: 'Have a look at some current articles if you need inspiration!'
    else  
    redirect_to root_path, notice: 'Article was successfully created'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if
      article_params[:title].empty?
      redirect_to edit_article_path, notice: 'Don\'t forget the title!'
    elsif  
      article_params[:content].empty?
      redirect_to edit_article_path, notice: 'If you want to delete this article, click on \'Delete Article\''
    else
      redirect_to @article, notice: 'Article was successfully updated'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
