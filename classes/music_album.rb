class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(id, publish_date, archived, on_spotify)
    @on_spotify = on_spotify
    super(id, publish_date, archived)
  end

  private

  def can_be_archived?
    @on_spotify && super
  end
end
