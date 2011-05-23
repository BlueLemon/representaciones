class Cambio < Movimiento

  validates :cuenta, :presence => true
  validates :monto, :presence => true

  after_save :withdraw
  before_save :deposit

  validate :existe_cotizacion
  validate :saldo_suficiente

  def rate
    c = cotizacion
    if c
      Money.add_rate(monto.currency,cuenta.monto.currency,c.compra)
    else
      nil
    end
  end

  # valida que exista plata en la cuenta.
  def saldo_suficiente
    if (cuenta && rate && (cuenta.monto < monto))
       errors.add(:base, "Debe tener suficiente dinero para efectuar el cambio")
    end
  end

  def cotizacion
    c = Cotizacion.buscar(fecha,monto,cuenta.monto).first
  end

  #valida que existe la cotizacion para el día exista.
  def existe_cotizacion
    monto(true)
    if !cotizacion
      errors.add(:base, "No se cargo la cotizacion para esta transaccion")
    end
  end

  #retiro de la cuenta el monto que voy a cambiar
  def withdraw
    #>>  Money.add_rate("USD","ARS",4.1)
    #=> 4.1
    #>> Money.new(100,"USD").exchange_to("ARS")
    #=> #<Money cents:410 currency:ARS>
    cuenta.entidad.withdraw(monto.exchange_to(cuenta.monto.currency))
  end

  #deposito el monto nuevo.
  def deposit
    cuenta.entidad.deposit(monto)
  end
end

