class Restaurant < ActiveRecord::Base
  belongs_to :category
  has_many :reservations
  has_many :users, through: :reservations

  def start_time
    # return 11am (as a DateTime)
  end

  def end_time
    # return 8pm (as a DateTime)
  end

end
