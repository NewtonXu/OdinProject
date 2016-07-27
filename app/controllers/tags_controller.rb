class TagsController < ApplicationController
    before_filter :require_login, only: [:destroy]
    def show
        @tag = Tag.find(params[:id])
    end
    
    def index
        @tag = Tag.all
    end
    
    def destroy 
        Tag.find(params[:id]).destroy
        
        flash.notice = "Tag deleted!"
        redirect_to action: 'index', status: 303
    end

end
