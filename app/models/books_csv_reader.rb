require 'csv'

module BooksCsvReader
  def self.parse(csv)
    line = 0
    books = []
    mapping = nil
    CSV.parse(csv) do |row|
      if line == 0
        mapping = read_mapping(row)
      else
        book = create_book(row, mapping)
        books << book if book
      end
      line += 1
    end

    books
  end

  def self.create_book(row, mapping)
    code = row[mapping['Cod']]
    title = row[mapping['Titlu']]
    authors_list = [
      "#{row[mapping['Autor1 prenume']]} #{row[mapping['Autor1 nume']]}".chomp,
      "#{row[mapping['Autor2 prenume']]} #{row[mapping['Autor2 nume']]}".chomp,
      "#{row[mapping['Autor3 prenume']]} #{row[mapping['Autor3 nume']]}".chomp,
      "#{row[mapping['Autor4 prenume']]} #{row[mapping['Autor4 nume']]}".chomp
    ]
    authors = authors_list.reject { |author| author.blank? }
                .join(',')
    if code && title && authors
      book = Book.where(code: code).first_or_initialize
      book.location = row[mapping['Raft']]
      book.authors = authors.force_encoding('ASCII-8BIT').force_encoding('UTF-8')
      book.title = title.force_encoding('ASCII-8BIT').force_encoding('UTF-8')
      book.publisher = row[mapping['Editura']]
      book.year = row[mapping['An']]
      book.notes = row[mapping['Obs']]
      book
    else
      nil
    end
  end

  # headers: "Raft", "Cod", "Autor1 prenume", "Autor1 nume", "Autor2 prenume", "Autor2 nume", "Autor3 prenume",
  # "Autor3 nume", "Autor4 prenume", "Autor4 nume", "Titlu", "Editura", "An", "Obs"
  def self.read_mapping(headers)
    mapping = {}
    headers.each_with_index do |header, idx|
      mapping[header] = idx
    end
    mapping
  end
end