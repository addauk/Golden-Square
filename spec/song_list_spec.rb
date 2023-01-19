require 'song_list'

RSpec.describe SongList do
  context "Have added a song to list" do
    it "returns one song" do
      song_list = SongList.new
      song_list.add("Walk this way")
      expect(song_list.list).to eq ["Walk this way"]
    end
  end

  context "Have added multiple songs to list" do
    it "returns all songs" do
      song_list = SongList.new
      song_list.add("Walk this way")
      song_list.add("Holiday")
      expect(song_list.list).to eq ["Walk this way","Holiday"]
    end
  end

  context "Have added no songs to list" do
    it "fails and provides an error message" do
      song_list = SongList.new
      expect{song_list.list}.to raise_error "No songs have been added to your list."
    end
  end


end