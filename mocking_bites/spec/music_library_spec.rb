require_relative '../lib/music_library.rb'

RSpec.describe MusicLibrary do

  it "add and lists tracks" do

    music_library = MusicLibrary.new
    track_1 = double :track
    track_2 = double :track
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1,track_2]

  end

  it "searches tracks by title" do

    music_library = MusicLibrary.new
    track_1 = double :track
    expect(track_1).to receive(:matches?).with("two").and_return(true)
    track_2 = double :track
    expect(track_2).to receive(:matches?).with("two").and_return(false)
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.search("two")).to eq [track_1]

  end
  
end