require_relative('../db/sql_runner.rb')
require_relative('./publisher.rb')

class Game

  attr_accessor :publisher_id, :name, :description, :stock_quantity, :buy_cost, :selling_price

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @publisher_id = options['publisher_id'].to_i
    @name = options['name']
    @description = options['description']
    @stock_quantity = options['stock_quantity'].to_i
    @buy_cost = options['buy_cost'].to_i
    @selling_price = options['selling_price'].to_i
  end

  # def stock_level_check
  #   if @stock_quantity <= 10
  #     return "#{@stock_quantity} Stock is low"
  #   elsif @stock_quantity == 0
  #     return "#{@stock_quantity} Out of stock, Resupply"
  #   else
  #     return @stock_quantity
  #   end
  # end

  def is_stock_low
    if @stock_quantity <= 10
      return true
    else
      return false
    end
  end

  def is_stock_empty
    if @stock_quantity == 0
      return true
    else
      return false
    end
  end

  def save
    sql = "INSERT INTO games
    (publisher_id, name, description, stock_quantity, buy_cost, selling_price)
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@publisher_id, @name, @description, @stock_quantity, @buy_cost, @selling_price]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM games"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE games SET (
    publisher_id, name, description, stock_quantity, buy_cost, selling_price
    ) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@publisher_id, @name, @description, @stock_quantity, @buy_cost, @selling_price, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM games WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM games"
    games = SqlRunner.run(sql)
    return games.map{|game|Game.new(game)}
  end

  def game_publisher
    sql = "SELECT * FROM publishers WHERE id = $1"
    values = [@publisher_id]
    result = SqlRunner.run(sql, values)
    publ_hash = result[0]
    publisher = Publisher.new(publ_hash)
    return publisher
  end
end
