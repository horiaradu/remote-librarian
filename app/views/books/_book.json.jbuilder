json.extract! book, :id, :code, :authors, :title, :publisher, :year, :notes, :location, :created_at, :updated_at
json.url book_url(book, format: :json)