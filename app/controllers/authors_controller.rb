class AuthorsController < ApplicationController

    before_action :get_author, except: [:index, :create]


    def index
        @authors = Author.all
        render json: @authors
    end

    def show
        render json: @author
    end

    def new 
        @author = Author.new
    end

    def edit
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            render json: @author, status: :created
        else
            render json: @author.errors, status: :unprocessable_entity
        end
    end 

    def update
        @author.update(author_params)
        render :nothing, status: :no_content
    end

    def destroy
        @author.delete
        render :nothing, status: :no_content
    end

    private
    
    def author_params
        params.require(:author).permit(:first_name, :last_name)
    end

    def get_author
        @author = Author.find(params[:id])
    end
end

