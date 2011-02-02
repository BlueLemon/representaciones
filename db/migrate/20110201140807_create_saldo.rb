class CreateSaldo < ActiveRecord::Migration
  def self.up

    create_table :saldos do |t|
          
      t.integer :entidad_id
      t.float :monto,:default=>0
      t.integer :moneda_id

      t.timestamps
    end
  end

  def self.down
    drop_table :saldos
  end
end
