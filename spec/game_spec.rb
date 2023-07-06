require_relative '../game'

RSpec.describe Game do
  describe '#can_be_archived?' do
    context 'when last_played_at is older than 2 years' do
      it 'returns true' do
        game = Game.new(Date.today - 3 * 365, true, Date.today - 2 * 365)
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when last_played_at is within 2 years' do
      it 'returns false' do
        game = Game.new(Date.today - 1 * 365, true, Date.today - 1 * 365)
        expect(game.can_be_archived?).to be false
      end
    end
  end
end
