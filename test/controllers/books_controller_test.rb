require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @book = books(:one)
  end

  test 'should get index' do
    get books_url
    assert_response :success
  end

  test 'should get new' do
    get new_book_url
    assert_response :success
  end

  test 'should create book' do
    assert_difference('Book.count') do
      post books_url, params: {
        book: {
          authors: @book.authors, code: @book.code + '_3', location: @book.location, notes: @book.notes,
          publisher: @book.publisher, title: @book.title, year: @book.year
        }
      }
    end

    assert_redirected_to books_url
  end

  test 'should show book' do
    get book_url(@book)
    assert_response :success
  end

  test 'should get edit' do
    get edit_book_url(@book)
    assert_response :success
  end

  test 'should update book' do
    patch book_url(@book), params: {
      book: {
        authors: @book.authors, code: @book.code, location: @book.location, notes: @book.notes,
        publisher: @book.publisher, title: @book.title, year: @book.year
      }
    }
    assert_redirected_to books_url
  end

  test 'should destroy book' do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
