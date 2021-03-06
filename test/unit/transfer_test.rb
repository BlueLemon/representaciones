require 'test_helper'

class TransferTest < ActiveSupport::TestCase
  def debt booking
    booking.agencia_deuda.cents
  end

  def source
    @source ||= reservas(:grand_celebration)
  end

  test "transfer money to a single booking" do
    destination = reservas(:ultra_park)
    original_debt = debt destination
    assert debt(source) < 0
    transfer = Transfer.create(
      date: Date.yesterday,
      source_id: source.id,
      debit: "30.48",
      balance: "0.00",
      destinations: { destination.id => "30.48" })
    assert transfer.valid?, transfer.errors.full_messages.join(" ")
    assert_equal 0, debt(source)
    assert_equal debt(destination), original_debt - 3048
    assert_equal <<DESC.chomp, transfer.description
Pase #{ Date.yesterday }
De: Reserva ref:1346266 pax:MOLINARI #930729311         |     -30.48 USD
 A: Reserva ref:123123123 #116927674                    |      30.48 USD
DESC
  end

  test "can only transfer to bookings with the same agency and operator" do
    transfer = Transfer.new source_id: source.id
    assert_includes transfer.destinations_options.map(&:first), reservas(:ultra_park)
    refute_includes transfer.destinations_options.map(&:first), reservas(:costa_magica)
    # no puede hacer pase a si misma
    refute_includes transfer.destinations_options.map(&:first), reservas(:grand_celebration)
  end

  test "destination options are ordered by reference number" do
    transfer = Transfer.new source_id: source.id
    first = reservas(:ultra_park).clone
    first.update_attributes(referencia: '9595', salida: 30.days.from_now)
    assert_equal first, transfer.destinations_options.first.first
    assert_equal reservas(:ultra_park), transfer.destinations_options.last.first
  end

  test "debit all the money by default" do
    transfer = Transfer.new source_id: source.id
    assert_equal 30.48, transfer.debit
  end

  test "add debt and currency as data attributes for options" do
    destination = reservas(:ultra_park)
    transfer = Transfer.new source_id: source.id
    option = transfer.destinations_options.find do |r, id, attr|
      r == destination
    end

    assert_equal 'USD', option[2][:'data-currency']
    assert_equal destination.agency_deuda.to_f, option[2][:'data-debt']
  end

  test "requires a source" do
    destination = reservas(:ultra_park)
    transfer = Transfer.new(
      date: Date.yesterday,
      debit: "30.48",
      destinations: { destination.id => "30.48" })
    refute transfer.valid?, "transfer without a source"
  end
end
