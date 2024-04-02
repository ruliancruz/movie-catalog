class Movie < ApplicationRecord
  enum release_status: { not_released: 0, released: 1 }
  enum draft_status: { draft: 0, published: 1 }

  belongs_to :director
  belongs_to :genre
end
