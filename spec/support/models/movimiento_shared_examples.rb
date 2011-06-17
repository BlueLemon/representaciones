require 'spec_helper'

shared_examples_for "un movimiento" do
  it { should belong_to(:entidad) }
  it { should validate_presence_of(:entidad) }
  it { should validate_presence_of(:fecha) }
  it { should validate_presence_of(:monto_cents) }
  it { should validate_presence_of(:monto_currency) }
  it 'si el monto es negativo da un error explicativo' do
    movimiento.monto = movimiento.monto * -1
    movimiento.valid?.should be_false
    movimiento.errors[:monto].should include("debe ser positivo")
  end
  it "no es posible actualizarlos" do
    movimiento.monto = movimiento.monto / 2
    expect { movimiento.save }.to raise_error(ActiveRecord::ReadOnlyRecord)
  end
  it "al destruirlos se desacen los cambios" do
    movimiento.should_receive(:deshacer) { true }
    movimiento.destroy
    movimiento.destroyed?.should be_true
  end
end

