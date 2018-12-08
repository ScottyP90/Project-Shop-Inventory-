require_relative("../models/game.rb")
require_relative("../models/publisher.rb")
require("pry-byebug")

Game.delete_all
Publisher.delete_all


publisher1 = Publisher.new({
  'publisher' => 'Rockstar'
  })

publisher1.save

publisher2 = Publisher.new({
  'publisher' => 'Activision'
  })

publisher2.save

publisher3 = Publisher.new({
  'publisher' => 'Nintendo'
  })

publisher3.save

publisher4 = Publisher.new({
  'publisher' => 'Insomniac'
  })

publisher4.save

publisher5 = Publisher.new({
  'publisher' => 'Square Enix'
  })

publisher5.save

publisher6 = Publisher.new({
  'publisher' => 'EA'
  })

publisher6.save

game1 = Game.new({
  'publisher_id' => "#{publisher1.id}",
  'name' => 'Red Dead Redemption 2',
  'description' => 'Old West Shooter',
  'stock_quantity' => '100',
  'buy_cost' => '40',
  'selling_price' => '55'
  })

game1.save

game2 = Game.new({
  'publisher_id' => "#{publisher1.id}",
  'name' => 'Grand Theft Auto 5',
  'description' => 'Crazy fun in the city of Los Santos',
  'stock_quantity'=> '50',
  'buy_cost' => '35',
  'selling_price' => '40'
  })

game2.save

game3 = Game.new({
  'publisher_id' => "#{publisher2.id}",
  'name' => "Spyro Trilogy",
  'description' => 'A story about a purple dragon',
  'stock_quantity' => '9',
  'buy_cost' => '30',
  'selling_price' => '40'
  })

game3.save

game4 = Game.new({
  'publisher_id' => "#{publisher3.id}",
  'name' => 'Smash Bros Ultamite',
  'description' => 'Nintendo characters fighting',
  'stock_quantity' => '0',
  'buy_cost' => '50',
  'selling_price' => '60'
  })

game4.save

# game4.stock_quantity = 50
# game4.update
#
# game_list = Game.all
# publisher = Publisher.all
#
# game2.delete
# publisher6.delete






binding.pry
nil
