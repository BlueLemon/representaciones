class Monto < ActiveRecord::Base
  belongs_to :moneda
  has_many :pagos
  has_many :reservas
  has_many :saldos
  
  def to_pesos(date)
    monto=valor  
    if moneda_id >1
      monto *= Cotizacion.a_la_fecha(date,moneda_id)[0].compra
    end
    monto
  end
  
  def e?(m2,fecha)
    (to_pesos(fecha) == m2.to_pesos(fecha))
  end
  
  def gt?(m2,fecha)
    (to_pesos(fecha) > m2.to_pesos(fecha))
  end
  
  def lt?(m2,fecha)
    (to_pesos(fecha) < m2.to_pesos(fecha))
  end

  def gte?(m2,fecha)
    (to_pesos(fecha) >= m2_to_pesos(fecha))
  end
  
  def lte?(m2,fecha)
    (to_pesos(fecha) <= m2.to_pesos(fecha))
  end

#  Ejemplo 

#  ruby-1.9.2-p0 >@dolares = Monto.new(:valor=>1,:moneda_id=>2)
#   => #<Monto id: nil, valor: 1.0, moneda_id: 2, created_at: nil, updated_at: nil> 
#  ruby-1.9.2-p0 > @pesos = Monto.new(:valor=>4,:moneda_id=>1)
#   => #<Monto id: nil, valor: 4.0, moneda_id: 1, created_at: nil, updated_at: nil> 
#  ruby-1.9.2-p0 > @dolares.to_pesos("2011-01-01")
#   => 3.98 
#  ruby-1.9.2-p0 > @pesos.e?(@dolares,"2011-01-01")
#   => false 
#  ruby-1.9.2-p0 > @pesos.e?(@dolares,"2011-01-02")
#   => false 
#  ruby-1.9.2-p0 > @pesos.e?(@dolares,"2011-01-03")
#   => true 
#  ruby-1.9.2-p0 > @pesos.e?(@dolares,"2011-01-04")
#   => falses

end