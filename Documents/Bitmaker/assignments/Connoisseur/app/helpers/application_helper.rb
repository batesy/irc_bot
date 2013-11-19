module ApplicationHelper
  def format_price(price_in_cents)
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end

  def sale_price(price_in_cents, limited_time_offer_savings_in_cents)
    savings_in_dollars = (price_in_cents - limited_time_offer_savings_in_cents).to_f / 100
    sprintf("%.2f", savings_in_dollars)
  end

end
