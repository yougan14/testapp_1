class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ :show, :edit, :update, :destroy ]

  # GET /articles or /articles.json
  def index
   @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    
    @article = Article.find(params[:id])
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(params.require(:article).permit(:title,:description))
    @article.user = User.first 
    if @article.save
      flash[:notice] = "article was created successfully...."
    redirect_to @article  
    else
    render 'new'
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title,:description))
    flash[:notice] = "Article was updated successfully."
    redirect_to @article
    else
      render 'edit'
    end
  end


def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to articles_path
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end

  end