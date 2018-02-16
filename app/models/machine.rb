class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines

  def average_snack_price
    snacks.average_price
  end
end
