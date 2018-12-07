require_relative('../db/sql_runner.rb')

class Publisher

  attr_accessor :publisher

  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @publisher = options['publisher']
  end

  def save
    sql = "INSERT INTO publishers publisher VALUES $1 RETURNING id"
    values = [@publisher]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM publishers"
    SqlRunner.run(sql)
  end

  def update
    sql "UPDATE publishers SET publisher = $1 WHERE id = $2"
    values = [@publisher, @id]
    SqlRunner.run(sql, values)
  end


end
