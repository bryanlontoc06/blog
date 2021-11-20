class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
       @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            flash[:notice] = "Category was successfully created!"
            redirect_to category_path(@category)
        else
            render :new
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:notice] = "Category was successfully updated"
            redirect_to category_path(@category)
        else
            render :edit
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        flash[:notice] = "Category was successfully deleted!"
        redirect_to categories_path
    end

    private
    def category_params
        params.require(:category).permit(:name, :body)
    end
end