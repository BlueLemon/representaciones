class Deposito < Movimiento
  # Callbacks
  after_save :depositar
  # Validaciones
  validates_presence_of :tdeposito, :numero

  # Asociaciones
  belongs_to :tdeposito
  monetize   :monto

  # Indica la cuenta en que fue depositado el dinero
  def cuenta
    entidad.cuenta(monto.currency,operadora)
  end

  # deshace el deposito antes de eliminar el registro


  private
  # deposita el dinero en la cuenta correspondiente.
  def depositar
    entidad.deposit(monto, operadora)
  end

  def deshacer
    entidad.withdraw(monto, operadora)
  end

end

