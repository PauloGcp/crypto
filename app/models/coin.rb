class Coin < ApplicationRecord
  
  belongs_to :mining_type #, optional: true -> deixa opcional o campo
  
end
