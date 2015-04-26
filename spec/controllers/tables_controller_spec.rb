require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TablesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Table. As you add validations to Table, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:table).attributes
  }

  let(:invalid_attributes) {
    attrs = build(:table).attributes
    attrs[:number] = ''
    attrs
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TablesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    let(:table) { create :table }

    it 'assigns all tables as @tables' do
      get :index
      expect(assigns(:tables)).to eq([table])
    end
  end

  describe 'GET #show' do
    let(:table) { create :table }

    it 'assigns the requested table as @table' do
      get :show, {:id => table.to_param}, valid_session
      expect(assigns(:table)).to eq(table)
    end
  end

  describe 'GET #new' do
    it 'assigns a new table as @table' do
      get :new, {}, valid_session
      expect(assigns(:table)).to be_a_new(Table)
    end
  end

  describe "GET #edit" do
    it "assigns the requested table as @table" do
      table = Table.create! valid_attributes
      get :edit, {:id => table.to_param}, valid_session
      expect(assigns(:table)).to eq(table)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Table" do
        expect {
          post :create, {:table => valid_attributes}, valid_session
        }.to change(Table, :count).by(1)
      end

      it "assigns a newly created table as @table" do
        post :create, {:table => valid_attributes}, valid_session
        expect(assigns(:table)).to be_a(Table)
        expect(assigns(:table)).to be_persisted
      end

      it "redirects to the created table" do
        post :create, {:table => valid_attributes}, valid_session
        expect(response).to redirect_to(Table.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved table as @table" do
        p invalid_attributes
        post :create, {:table => invalid_attributes}, valid_session
        expect(assigns(:table)).to be_a_new(Table)
      end

      it "re-renders the 'new' template" do
        post :create, {:table => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { build(:table).attributes }
      let(:table) { create :table }

      it "updates the requested table" do
        put :update, {:id => table.to_param, :table => new_attributes}, valid_session
        table.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested table as @table" do
        table = Table.create! valid_attributes
        put :update, {:id => table.to_param, :table => valid_attributes}, valid_session
        expect(assigns(:table)).to eq(table)
      end

      it "redirects to the table" do
        table = Table.create! valid_attributes
        put :update, {:id => table.to_param, :table => valid_attributes}, valid_session
        expect(response).to redirect_to(table)
      end
    end

    context "with invalid params" do
      it "assigns the table as @table" do
        table = Table.create! valid_attributes
        put :update, {:id => table.to_param, :table => invalid_attributes}, valid_session
        expect(assigns(:table)).to eq(table)
      end

      it "re-renders the 'edit' template" do
        table = Table.create! valid_attributes
        put :update, {:id => table.to_param, :table => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested table" do
      table = Table.create! valid_attributes
      expect {
        delete :destroy, {:id => table.to_param}, valid_session
      }.to change(Table, :count).by(-1)
    end

    it "redirects to the tables list" do
      table = Table.create! valid_attributes
      delete :destroy, {:id => table.to_param}, valid_session
      expect(response).to redirect_to(tables_url)
    end
  end

end