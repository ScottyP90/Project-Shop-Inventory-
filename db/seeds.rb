require_relative("../models/game.rb")
require_relative("../models/publisher.rb")
require("pry-byebug")


publisher1 = Publisher.new({
  'id' => '1',
  'publisher' => 'Rockstar'
  })

publisher1.save

game1 = Game.new({
  'id' => '3',
  'publisher_id' => "#{publisher1}",
  'name' => 'Red Dead Redemption 2',
  'description' => 'Old West Shooter',
  'stock_quantity' => '100',
  'buy_cost' => '40',
  'selling_price' => '55'
  })

game1.save










binding.pry
nil
