require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(publish_date)
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    last_played_at_year = Date.parse(@last_played_at).year
    current_year - last_played_at_year > 2 && super
  end
end
