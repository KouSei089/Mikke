require 'rails_helper'

RSpec.describe 'Soliloquy', type: :system do
  before do
    @user = User.create(username: '泉', email: 'test@example.com', password: '1234', password_confirmation: '1234')
    @soliloquy = Soliloquy.create(text: 'ああああ', user_id: @user.id, emotion_point: '0.5')
  end

  context 'メディアタイプPC' do
    it 'soliloquyが正しく作成できる' do
      login(@user)
    end
  end
end
