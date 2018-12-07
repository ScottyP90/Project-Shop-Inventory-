class Publisher

  attr_accessor :publisher

  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @publisher = options['publisher']
  end





end
