require('minitest/autorun')
require('minitest/rg')
require_relative('../game.rb')

class GameTest < MiniTest::Test

  def setup()
    options1 = {
      'id' => '3',
      'publisher_id' => '1',
      'name' => 'Red Dead Redemption 2',
      'description' => 'Old West Shooter',
      'stock_quantity' => '100',
      'buy_cost' => '40',
      'selling_price' => '55'
    }
    options2 = {
      'id' => '4',
      'publisher_id' => '2',
      'name' => "Spyro Trilogy",
      'description' => 'A story about a purple dragon',
      'stock_quantity' => '9',
      'buy_cost' => '30',
      'selling_price' => '40'
    }
    options3 = {
      'id' => '5',
      'publisher_id' => '4',
      'name' => 'Smash Bros Ultamite',
      'description' => 'Nintendo characters fighting',
      'stock_quantity' => '0',
      'buy_cost:' => '50',
      'selling_price' => '60'
    }

    @game1 = Game.new(options1)
    @game2 = Game.new(options2)
    @game3 = Game.new(options3)

  end

  def test_name
    assert_equal("Red Dead Redemption 2", @game1.name)
  end

  def test_id
    assert_equal(4, @game2.id)
  end

  def test_publisher_id
    assert_equal(4, @game3.publisher_id)
  end

  def test_description
    assert_equal("Nintendo characters fighting", @game3.description)
  end

  def test_stock
    assert_equal(9,@game2.stock_quantity)
    assert_equal(true, @game2.is_stock_low)
  end

  def test_is_stock_high
    assert_equal(false, @game1.is_stock_low)
  end

  def test_buy_cost
    assert_equal(30, @game2.buy_cost)
  end

  def test_selling_price
    assert_equal(55, @game1.selling_price)
  end


end
