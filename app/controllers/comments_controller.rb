class CommentsController < ApplicationController
    before_action :get_article

    def index
        @comments = @article.comments
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def new
        @comment = @article.comments.build
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            flash[:notice] = "Comment was successfully updated"
            redirect_to article_comments_path(@article.id, @comment.id)
        else
            render :edit
        end
    end 

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:notice] = "Comment was successfully deleted!"
        redirect_to article_comments_path(@article.id, @comment.id)
    end

    def create
        @comment = @article.comments.build(comment_params)
        if @comment.save
            redirect_to article_comments_path(@article.id, @comment.id)
        else
            render :new
        end
    end

    private

    def get_article
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:body, :article_id)
    end 

end
