class Pokemon < ApplicationRecord
  belongs_to :trainer
  belongs_to :type
end
