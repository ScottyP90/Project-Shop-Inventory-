require_relative('../db/sql_runner.rb')

class Publisher

  attr_accessor :publisher

  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @publisher = options['publisher']
  end

  def save
    sql = "INSERT INTO publishers (publisher) VALUES ($1) RETURNING id"
    values = [@publisher]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM publishers"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE publishers SET publisher = $1 WHERE id = $2"
    values = [@publisher, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM publishers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.all
    sql = "SELECT * FROM publishers"
    publishers = SqlRunner.run(sql)
    return publishers.map{|publisher|Publisher.new(publisher)}
  end

  def games
    sql = "SELECT * FROM games WHERE publisher_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    games = results.map{|game_hash|Game.new(game_hash)}
    return games
  end

end
