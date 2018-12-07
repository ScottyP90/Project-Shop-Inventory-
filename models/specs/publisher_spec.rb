require('minitest/autorun')
require('minitest/rg')
require_relative('../publisher.rb')

class PublisherTest < MiniTest::Test

  def setup
    publisher1 = {
      'id' => '1',
      'publisher' => 'Rockstar'
    }

    @publisher1 = Publisher.new(publisher1)

  end

  def test_id
    assert_equal(1, @publisher1.id)
  end

  def test_publisher
    assert_equal('Rockstar', @publisher1.publisher)
  end



end
