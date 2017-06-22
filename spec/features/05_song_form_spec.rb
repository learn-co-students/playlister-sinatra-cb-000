require 'spec_helper'

describe "Song Forms" do
  let(:artist_name) { "Person with a Face" }
  let(:artist_slug) { "person-with-a-face" }
  let(:genre_1_name) { "Hippity Hop" }
  let(:genre_2_name) { "New Age Garbage" }
  let(:song_name) { "That One with the Guitar" }
  let!(:genre_1) { Genre.create(name: genre_1_name) }
  let!(:genre_2) { Genre.create(name: genre_2_name) }

  describe "/songs/new" do
    before do
      visit "/songs/new"
    end

    context "without an existing artist" do
      it "creates a new artist on submit" do
        expect {
          fill_in "song[name]", with: song_name
          check "new-age-garbage"
          fill_in "artist[name]", with: artist_name
          click_button "Create Song"
        }.to change(Artist, :count).by(1)
      end

      it "creates a new song on submit" do
        fill_in "song[name]", with: song_name
        check "new-age-garbage"
        fill_in "artist[name]", with: artist_name
        click_button "Create Song"

        expect(page).to have_content(song_name)
        expect(page).to have_content(artist_name)
        expect(page).to have_content(genre_2_name)
        expect(page).to have_content("Successfully created song.")
      end

      it "redirects to '/songs/:slug' after creation" do
        fill_in "song[name]", with: song_name
        check "new-age-garbage"
        fill_in "artist[name]", with: artist_name
        click_button "Create Song"
        expect(page.current_path).to eq('/songs/that-one-with-the-guitar')
      end
    end

    context "with an existing artist" do
      before do
        artist = Artist.create(name: artist_name)
        visit "/songs/new"
      end

      it "does not create a new artist" do
        expect {
          fill_in "song[name]", with: song_name
          check "hippity-hop"
          choose (artist_name.downcase.gsub(" ","-")) # choose radio button with id == artist slug
          click_button "Create Song"
        }.not_to change(Artist, :count)
      end

      it "creates a new song and associates it with an existing artist" do
        fill_in "song[name]", with: song_name
        check "hippity-hop"
        fill_in "artist[name]", with: artist_name
        click_button "Create Song"

        expect(page).to have_content(song_name)
        expect(page).to have_content(artist_name)
        expect(page).to have_content(genre_1_name)
        expect(page).to have_content("Successfully created song.")
      end

      it "redirects to '/songs/:slug' after creation" do
        fill_in "song[name]", with: song_name
        check "new-age-garbage"
        fill_in "artist[name]", with: artist_name
        click_button "Create Song"
        expect(page.current_path).to eq('/songs/that-one-with-the-guitar')
      end
    end
  end

  describe "/songs/:slug/edit" do
    before do
      @song = Song.create(name: song_name)
      artist = Artist.create(name: artist_name)

      @song.song_genres.create(genre: genre_1)
      @song.artist = artist

      @song.save

      visit "/songs/#{@song.slug}/edit"
    end

    context "changing a song's artist" do
      it "updates the song's artist" do
        fill_in "artist[name]", with: "Some Nobody"
        click_on "Save"

        expect(page).to have_content("Successfully updated song.")
        expect(page).to have_content(song_name)
        expect(page).to have_content("Some Nobody")
      end

      it "renders to the song show page" do
        fill_in "artist[name]", with: "That singer"
        click_on "Save"
        expect(page.current_path).to eq("/songs/that-one-with-the-guitar")
      end
    end

    context "changing a song's genres" do
      it "has a checkbox element on the form" do
        expect(page.body).to include("checkbox")
      end

      it "updates the song's genres" do
        uncheck "new-age-garbage"
        check "hippity-hop"
        click_on "Save"

        expect(page).to have_content("Successfully updated song.")
        expect(page).to have_content(song_name)
        expect(page).to have_content(artist_name)
        expect(page).to have_content("Hippity Hop")
      end

      it "renders to the song show page" do
        uncheck "hippity-hop"
        check "new-age-garbage"
        click_on "Save"
        expect(page.current_path).to eq("/songs/that-one-with-the-guitar")
      end
    end
  end
end
