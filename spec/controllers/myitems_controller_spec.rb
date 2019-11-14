require 'rails_helper'

RSpec.describe MyitemsController, type: :controller do

    describe "delete#destroy" do
    it "delete the item" do
      user = create(:user)
      item = create(:item)
      expect{
      delete :destroy, params: { id: item }
      }.to change(Item,:count).by(-1)
    end
  end

end