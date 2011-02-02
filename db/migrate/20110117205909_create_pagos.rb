class CreatePagos < ActiveRecord::Migration
  def self.up

    create_table :pagos do |t|
          
      t.integer :entidad_id
      t.integer :reserva_id
      t.integer :tpago_id
      t.integer :tdeposito_id
      t.integer :moneda_id
      t.date :fecha 
      t.float :monto

      t.timestamps
    end
  end

  def self.down
    drop_table :pagos
  end
end
