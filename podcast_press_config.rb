set podcast_title: 'Gaslight Podcast'
set artist: "Gaslight"
set artwork: "./embedded-artwork.jpg"
set clear: true
set date: Time.now
set title: "Gaslight Podcast ##{get :episode_number}: #{get :title}"
set filename: "gaslight-podcast-#{get :episode_number, min_digits: 3}.mp3"
