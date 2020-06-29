class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    
      if @article.save
        flash[:success] = "Article was created successfully"
        redirect_to @article
      else
        render 'new'
        
      end
    end
 

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    
      if @article.update(article_params)
        flash[:success] = "Article was updated successfully"
        redirect_to @article
      else
        render 'edit'
      end
    end
  

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
   flash[:success] = "Article was deleted successfully"
   redirect_to @article
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
