Zugfahrt::Application.routes.draw do
  resources :players

  get 'map1'                      => 'maps#risk_map'
  post 'draft_troops'             => 'maps#draft_troops'
  get  'show_nearby_enemies'      => 'maps#show_nearby_enemies'
  post 'attack_country'           => 'maps#attack_country'
  post 'end_turn'                 => 'maps#end_turn'
  get  'show_nearby_friends'      => 'maps#show_nearby_friends'
  post 'move_troops'              => 'maps#move_troops'
  post 'next_player'              => 'maps#next_player'

  root "maps#risk_map"

# Alternative maps
  get 'map2' => 'maps#risk_map2'
  get 'map3' => 'maps#risk_map3'
end
