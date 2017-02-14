require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    @id ||=1
    db.execute("INSERT INTO pokemon (id, name, type)
                VALUES  (#{@id}, '#{name}', '#{type}');")
  end

  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon;
                          WHERE id = #{id}").flatten
    pokemon = self.new(id: id,name: results[1],type: results[2],db: db)
  end

end
