class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride

    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif self.user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets to ride the Roller Coaster."
    elsif self.user.height < self.attraction.min_height
      return "Sorry. You are not tall enough to ride the Roller Coaster."
    else
      new_tickets = self.user.tickets - self.attraction.tickets
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.happiness = new_happiness
      self.user.nausea = new_nausea
      self.user.tickets = new_tickets

    end
    self.user.save
  end

end
