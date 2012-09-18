set clear: true
set podcast_title: 'Gaslight Podcast'
set artist: "Gaslight"
set artwork: "./embedded_artwork.jpg"
set date: Time.now
set title: "Gaslight Podcast ##{get :episode_number}: #{get :title}"
set filename: "gaslight-podcast-#{get :episode_number, min_digits: 3}.mp3"
