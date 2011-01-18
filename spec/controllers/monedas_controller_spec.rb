require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe MonedasController do

  def mock_moneda(stubs={})
    @mock_moneda ||= mock_model(Moneda, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all monedas as @monedas" do
      Moneda.stub(:all) { [mock_moneda] }
      get :index
      #assigns(:monedas).should eq([mock_moneda])
      assigns(:monedas).should eq([])
    end
  end

  describe "GET show" do
    it "assigns the requested moneda as @moneda" do
      Moneda.stub(:find).with("37") { mock_moneda }
      get :show, :id => "37"
      assigns(:moneda).should be(mock_moneda)
    end
  end

  describe "GET new" do
    it "assigns a new moneda as @moneda" do
      Moneda.stub(:new) { mock_moneda }
      get :new
      assigns(:moneda).should be(mock_moneda)
    end
  end

  describe "GET edit" do
    it "assigns the requested moneda as @moneda" do
      Moneda.stub(:find).with("37") { mock_moneda }
      get :edit, :id => "37"
      assigns(:moneda).should be(mock_moneda)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created moneda as @moneda" do
        Moneda.stub(:new).with({'these' => 'params'}) { mock_moneda(:save => true) }
        post :create, :moneda => {'these' => 'params'}
        assigns(:moneda).should be(mock_moneda)
      end

      it "redirects to the created moneda" do
        Moneda.stub(:new) { mock_moneda(:save => true) }
        post :create, :moneda => {}
        response.should redirect_to(:controller =>:monedas,:action=>'show',:format=>:js,:id=>mock_moneda.id)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved moneda as @moneda" do
        Moneda.stub(:new).with({'these' => 'params'}) { mock_moneda(:save => false) }
        post :create, :moneda => {'these' => 'params'}
        assigns(:moneda).should be(mock_moneda)
      end

      it "re-renders the 'new' template" do
        Moneda.stub(:new) { mock_moneda(:save => false) }
        post :create, :moneda => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested moneda" do
        Moneda.stub(:find).with("37") { mock_moneda }
        mock_moneda.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :moneda => {'these' => 'params'}
      end

      it "assigns the requested moneda as @moneda" do
        Moneda.stub(:find) { mock_moneda(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:moneda).should be(mock_moneda)
      end

      it "redirects to the moneda" do
        Moneda.stub(:find) { mock_moneda(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(:controller =>:monedas,:action=>'show',:format=>:js,:id=>mock_moneda.id)
      end
    end

    describe "with invalid params" do
      it "assigns the moneda as @moneda" do
        Moneda.stub(:find) { mock_moneda(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:moneda).should be(mock_moneda)
      end

      it "re-renders the 'edit' template" do
        Moneda.stub(:find) { mock_moneda(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested moneda" do
      Moneda.stub(:find).with("37") { mock_moneda }
      mock_moneda.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    #it "redirects to the monedas list" do
    #  Moneda.stub(:find) { mock_moneda }
    #  delete :destroy, :id => "1"
    #  response.should redirect_to(monedas_url)
    #end
  end

end
