require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('my_world', true, { day: 31, month: 5, year: 2000 })
  end

  it 'Should return a MusicAlbum object' do
    expect(@music_album).to be_an_instance_of MusicAlbum
  end

  describe '#name' do
    it 'should return an album name' do
      expect(@music_album.name).to eq 'my_world'
    end
  end

  it "should return true if parent's method returns true AND if on_spotify equals true" do
    expect(@music_album.can_be_archived?).to eq true
  end
end
