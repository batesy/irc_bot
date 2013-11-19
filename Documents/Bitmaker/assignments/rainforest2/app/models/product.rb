class Product < ActiveRecord::Base
  validates :name, :description, :photo, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  has_many :reviews
  has_many :users, :through => :reviews

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end

end
