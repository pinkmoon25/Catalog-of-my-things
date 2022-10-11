class Book
  attr_accessor :publisher, :cover_state

  def initialize(publisher:, cover_state:)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    (DateTime.now.year - publish_date) >= 10 || @cover_state == 'bad'
  end
end
