class Book < ApplicationRecord
  self.per_page = 20
  default_scope { order(title: :asc) }
end
