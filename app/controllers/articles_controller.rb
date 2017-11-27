class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(allowed_params)
    redirect_to @article, notice: 'Article has been updated'
    else
      render :edit
    end
  end

  private
  def allowed_params
    params.require(:article).permit(:name, :author, :content, :published_at)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
