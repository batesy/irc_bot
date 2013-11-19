class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  # what makes for a valid reservation?

  # Total guests less than 100 at any given time
  # Reso lasts for 2  hours
  # Reso must start between 11am-8pm  

end
