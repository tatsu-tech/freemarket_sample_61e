require 'rails_helper'

RSpec.describe ItemsController, type: :controller do


    describe "GET #new" do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
    it "saves the new contact in the database" do
      user = create(:user)
      item = create(:item)
      expect{
        post :create, params: {
          item: attributes_for(:item),images:[], user_id: user
        }
      }.to change(Item, :count).by(1)
    end
    it "redirects to item" do
      user = create(:user)
      item = create(:item)
      post :create, params: {
          item: attributes_for(:item),images:[], user_id: user
        }
      expect(response).to redirect_to myitem_path(:id)
    end
  end

    describe 'GET #show' do
      it "assigns the requested item to @item" do
        user = create(:user)
        item = create(:item)
        get :show, params: { id: item }
        expect(assigns(:item)).to eq item
      end
  
      it "renders the :show template" do
        user = create(:user)
        item = create(:item)
        get :show, params: { id: item }
        expect(response).to render_template :show
      end
    end

    describe "GET #edit" do
      it "assigns the requested item to @item" do
        user = create(:user)
        item = create(:item)
        get :edit, params: { id: item }
        expect(assigns(:item)).to eq item
      end

      it "renders the :edit template" do
        user = create(:user)
        item = create(:item)
        get :edit, params: { id: item }
        expect(response).to render_template :edit
      end
    end


 end

  describe 'GET #index' do
    it "assigns the requested item to @item" do
      user = create(:user)
      item = create(:item)
      get :index, params: { id: item }
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end


end
