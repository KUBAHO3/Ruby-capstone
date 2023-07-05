require_relative './item'

class Book < Item
  def initialize(publisher, cover_state, id, publish_date, archive)
    @publisher = publisher
    @cover_state = cover_state
    super(id, publish_date, archive)
  end

  def can_be_archived?
    super || cover_state == "bad"
  end
end