require 'csv'

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    query = if params[:search].present?
              {
                title_cont: params[:search],
                authors_cont: params[:search]
              }.try(:merge, m: 'or')
            else
              params[:q]
            end

    @q = Book.ransack(query)
    @books = @q.result(distinct: true).paginate(:page => params[:page], per_page: params[:per_page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_path, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /books/search
  # GET /books/search.json
  def search
    @search ||= Book.search(query_params)
  end

  def manage
  end

  def import
    @books = BooksCsvReader
               .parse(params[:file].read)
               .uniq { |book| book.code }
    Book.transaction do
      @books.each { |book| book.save! }
    end
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Successfully imported your books.' }
      format.json { render :index, status: :created, location: @books }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:code, :authors, :title, :publisher, :year, :notes, :location)
  end

  def query_params
    if params[:q].present?
      params[:q].delete_if { |_, value| value.blank? }
    end
  end
end
