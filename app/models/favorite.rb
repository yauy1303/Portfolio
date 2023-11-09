class Favorite < ApplicationRecord
  
  # アソシエーション
  belongs_to :member
  belongs_to :article
  
end
