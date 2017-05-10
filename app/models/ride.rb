class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    case
    when user.tickets >= attraction.tickets && user.height >= attraction.min_height
      spent_tickets = user.tickets - attraction.tickets
      new_nausea = user.nausea + attraction.nausea_rating
      new_happiness = user.happiness + attraction.happiness_rating
      user.update(tickets: spent_tickets, nausea: new_nausea, happiness: new_happiness)
      "Thanks for riding the #{attraction.name}!"
    when user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    when user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    when user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end
end
