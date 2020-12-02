namespace :albums do
  desc "Add players to specific album"
  task add_players: :environment do
    update_album_players
  end

  def update_album_players(start_option: nil)
    Album.find_each(start: start_option) do |album|
      player = Player.find_by(id: album.player_id)
      begin
        ## Used only test when object is invalid and raised error
        if album.name.empty?
          raise "Album name can't blank"
        else
          player = Player.find_by(id: album.player_id)
          album.players << player
        end
      rescue
        puts "Error updading album with id #{album.id}"
        next_album_id = album.id +=1
         return if Album.find_by(id: next_album_id) == nil?
         update_album_players(start_option: next_album_id)
      end
    end
  end
end
