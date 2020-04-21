require 'rails_helper'

describe 'FacebookLogin', type: :request do
  let(:user) { create(:user) }
  let(:user_hash) do
    {
      access_token: user.token,
      user_data: { name: user.name, id: user.uid },
      user_avatar: user.image_url,
      provider: user.provider
    }
  end

  before do
    get '/auth/facebook/create_account', params: { user_hash: user_hash }
  end

  it 'should set user_id' do
    expect(session[:user_id]).to eq(User.last.id)
  end

  it 'should redirect to root' do
    expect(response).to redirect_to root_path
  end
end

describe "GET '/auth/failure'" do

  it 'should redirect to root' do
    get '/auth/failure'
    expect(response).to redirect_to root_path
  end
end