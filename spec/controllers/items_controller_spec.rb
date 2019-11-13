require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

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
