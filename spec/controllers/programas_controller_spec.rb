require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ProgramasController do

  def mock_programa(stubs={})
    @mock_programa ||= mock_model(Programa, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all programas as @programas" do
      Programa.stub(:all) { [mock_programa] }
      get :index
      #assigns(:programas).should eq([mock_programa])
      assigns(:programas).should eq([])
    end
  end

  describe "GET show" do
    it "assigns the requested programa as @programa" do
      Programa.stub(:find).with("37") { mock_programa }
      get :show, :id => "37"
      assigns(:programa).should be(mock_programa)
    end
  end

  describe "GET new" do
    it "assigns a new programa as @programa" do
      Programa.stub(:new) { mock_programa }
      get :new
      assigns(:programa).should be(mock_programa)
    end
  end

  describe "GET edit" do
    it "assigns the requested programa as @programa" do
      Programa.stub(:find).with("37") { mock_programa }
      get :edit, :id => "37"
      assigns(:programa).should be(mock_programa)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created programa as @programa" do
        Programa.stub(:new).with({'these' => 'params'}) { mock_programa(:save => true) }
        post :create, :programa => {'these' => 'params'}
        assigns(:programa).should be(mock_programa)
      end

      it "redirects to the created programa" do
        Programa.stub(:new) { mock_programa(:save => true) }
        post :create, :programa => {}
        response.should redirect_to(:controller =>:programas,:action=>'show',:format=>:js,:id=>mock_programa.id)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved programa as @programa" do
        Programa.stub(:new).with({'these' => 'params'}) { mock_programa(:save => false) }
        post :create, :programa => {'these' => 'params'}
        assigns(:programa).should be(mock_programa)
      end

      it "re-renders the 'new' template" do
        Programa.stub(:new) { mock_programa(:save => false) }
        post :create, :programa => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested programa" do
        Programa.stub(:find).with("37") { mock_programa }
        mock_programa.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :programa => {'these' => 'params'}
      end

      it "assigns the requested programa as @programa" do
        Programa.stub(:find) { mock_programa(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:programa).should be(mock_programa)
      end

      it "redirects to the programa" do
        Programa.stub(:find) { mock_programa(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(:controller =>:programas,:action=>'show',:format=>:js,:id=>mock_programa.id)
      end
    end

    describe "with invalid params" do
      it "assigns the programa as @programa" do
        Programa.stub(:find) { mock_programa(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:programa).should be(mock_programa)
      end

      it "re-renders the 'edit' template" do
        Programa.stub(:find) { mock_programa(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested programa" do
      Programa.stub(:find).with("37") { mock_programa }
      mock_programa.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    #it "redirects to the programas list" do
    #  Programa.stub(:find) { mock_programa }
    #  delete :destroy, :id => "1"
    #  response.should redirect_to(programas_url)
    #end
  end

end