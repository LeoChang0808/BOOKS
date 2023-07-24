class BooksController < ApplicationController

    before_action :get_book, only: [:edit, :update, :show, :destroy]

    def index
        @books = Book.order(id: :desc)
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(params_book)
        if @book.save
            redirect_to root_path, notice: "新增成功"
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @book.update(params_book)
            redirect_to root_path, notice: "修改成功"
        else
            render :edit
        end
    end

    def destroy
        @book.destroy
        redirect_to root_path, notice: "刪除成功"
    end

    def params_book
        params.require(:book).permit(:title, :content, :page, :price)
    end

    def get_book
        @book = Book.find(params[:id])
    end
end
