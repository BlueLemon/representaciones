class CreateEntidads < ActiveRecord::Migration
  def self.up
    create_table :entidads do |t|
      t.string  :name
      t.string  :type
      t.string  :calle
      t.string  :cuit
      t.string  :telefono
      t.string  :legajo
      t.string  :email
      t.string  :web
      t.integer :localidad_id

      t.timestamps
    end
  end

  def self.down
    drop_table  :entidads
  end
end

