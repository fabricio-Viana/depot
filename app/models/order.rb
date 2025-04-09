class Order < ApplicationRecord
  enum pay_type: {
    "Cheque" => 0, 
    "Cartão de Credito" => 1, 
    "PIX" => 2
  }
  has_many :line_items, dependent: :destroy
  # ...
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
end
