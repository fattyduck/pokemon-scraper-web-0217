require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)

    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES  (?, ?);
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon;
                          WHERE id = #{id}").flatten
    pokemon = self.new(id: id,name: results[1],type: results[2],db: db)
    pokemon.hp = results[3]
    pokemon
  end

  def alter_hp(hp, db)
    sql = <<-SQL
      UPDATE pokemon
      SET hp = ?
    SQL
    db.execute(sql, hp)
    #binding.pry

  end
end
