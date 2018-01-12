class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = User.find_by(id: user_id)
    @attraction = Attraction.find_by(id: attraction_id)
    if @user.tickets >= @attraction.tickets && @user.height >= @attraction.min_height
      new_tickets = @user.tickets - @attraction.tickets
      new_happiness = @user.happiness + @attraction.happiness_rating
      new_nausea = @user.nausea + @attraction.nausea_rating
      @user.update(happiness: new_happiness, nausea: new_nausea, tickets: new_tickets)
      @user.save
    elsif @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif @user.tickets < @attraction.tickets
      return "Sorry. You do not have enough tickets to ride the Roller Coaster."
    elsif @user.height < @attraction.min_height
      return "Sorry. You are not tall enough to ride the Roller Coaster."
    end
    binding.pry
  end

end
