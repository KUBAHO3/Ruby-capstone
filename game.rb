class Game < Item
    attr_accessor :multiplayer, :last_played_at
  
    def initialize(publish_date, multiplayer, last_played_at, archived: false)
      super(publish_date, archived: archived)
      @multiplayer = multiplayer
      @last_played_at = last_played_at
    end
  
    def can_be_archived?
      last_played_at < (Date.today - (1 * 365))
    end
  end
  