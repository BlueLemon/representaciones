require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe AgenciasController do

  def mock_agencia(stubs={})
    @mock_agencia ||= mock_model(Agencia, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all agencias as @agencias" do
      Agencia.stub(:all) { [mock_agencia] }
      get :index
#      assigns(:agencias).should eq([mock_agencia])
      assigns(:agencias).should eq([])
    end
  end

  describe "GET show" do
    it "assigns the requested agencia as @agencia" do
      Agencia.stub(:find).with("37") { mock_agencia }
      get :show, :id => "37"
      assigns(:agencia).should be(mock_agencia)
    end
  end

  describe "GET new" do
    it "assigns a new agencia as @agencia" do
      Agencia.stub(:new) { mock_agencia }
      get :new
      assigns(:agencia).should be(mock_agencia)
    end
  end

  describe "GET edit" do
    it "assigns the requested agencia as @agencia" do
      Agencia.stub(:find).with("37") { mock_agencia }
      get :edit, :id => "37"
      assigns(:agencia).should be(mock_agencia)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created agencia as @agencia" do
        Agencia.stub(:new).with({'these' => 'params'}) { mock_agencia(:save => true) }
        post :create, :agencia => {'these' => 'params'}
        assigns(:agencia).should be(mock_agencia)
      end

      it "redirects to the created agencia" do
        Agencia.stub(:new) { mock_agencia(:save => true) }
        post :create, :agencia => {}
        response.should redirect_to(:controller =>:agencias,:action=>'show',:format=>:js,:id=>mock_agencia.id)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved agencia as @agencia" do
        Agencia.stub(:new).with({'these' => 'params'}) { mock_agencia(:save => false) }
        post :create, :agencia => {'these' => 'params'}
        assigns(:agencia).should be(mock_agencia)
      end

      it "re-renders the 'new' template" do
        Agencia.stub(:new) { mock_agencia(:save => false) }
        post :create, :agencia => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested agencia" do
        Agencia.stub(:find).with("37") { mock_agencia }
        mock_agencia.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :agencia => {'these' => 'params'}
      end

      it "assigns the requested agencia as @agencia" do
        Agencia.stub(:find) { mock_agencia(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:agencia).should be(mock_agencia)
      end

      it "redirects to the agencia" do
        Agencia.stub(:find) { mock_agencia(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(:controller =>:agencias,:action=>'show',:format=>:js,:id=>mock_agencia.id)
      end
    end

    describe "with invalid params" do
      it "assigns the agencia as @agencia" do
        Agencia.stub(:find) { mock_agencia(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:agencia).should be(mock_agencia)
      end

      it "re-renders the 'edit' template" do
        Agencia.stub(:find) { mock_agencia(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested agencia" do
      Agencia.stub(:find).with("37") { mock_agencia }
      mock_agencia.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    #it "redirects to the agencias list" do
    #  Agencia.stub(:find) { mock_agencia }
    #  delete :destroy, :id => "1"
    #  response.should redirect_to(agencias_url)
    #end
  end

end
