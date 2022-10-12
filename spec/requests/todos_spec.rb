require 'rails_helper'

RSpec.describe "Todos Request", type: :request do

  describe 'POST #create' do
    context 'todoのtextが入力されているとき' do
      it 'TODOが投稿できること' do
      end
    end
    context 'todoのtextが入力されていないとき' do
      it 'TODOが投稿できないこと' do
      end
    end
  end
end