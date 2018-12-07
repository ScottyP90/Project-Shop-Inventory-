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


end
