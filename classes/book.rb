require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
    super(publish_date)
  end

  private

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
