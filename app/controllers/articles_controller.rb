class ArticlesController < ApplicationController
    include ArticleHelper
    before_filter :require_login, except: [:index, :show]
    def index
        @articles = Article.all
    end
    def show
        @articles = Article.find(params[:id]) 
        @comment = Comment.new
        @comment.article_id=@articles.id
    end
    def new 
        @articles = Article.new
    end 
    def create 
        @articles = Article.new(article_params)
        @articles.save
        flash.notice = "Article '#{@articles.title}' created!"
        redirect_to article_path(@articles)
    end
    
    def destroy 
        Article.find(params[:id]).destroy
        
        flash.notice = "Article deleted!"
        redirect_to action: 'index', status: 303
    end
    
    def edit
        @articles = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
    end 
    
   
    
end
