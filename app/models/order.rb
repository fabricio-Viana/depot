class Order < ApplicationRecord
  enum pay_type: {
    "Cheque" => 0, 
    "Cartão de Credito" => 1, 
    "PIX" => 2
  }
end
