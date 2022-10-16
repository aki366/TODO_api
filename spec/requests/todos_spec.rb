require 'rails_helper'

RSpec.describe "Todos Request", type: :request do

  # 正常系
  describe '正常系' do
    describe 'GET #show' do
      context '存在するTODOにアクセスしたとき' do
        it 'TODOの詳細情報を取得できること' do
        end
      end
    end

    describe 'GET #index' do
      it 'TODOの一覧を取得できること' do
      end
    end

    describe 'GET #edit' do
      context '存在するTODOを編集したとき' do
        it 'TODOが編集できること' do
        end
      end
    end

    describe 'POST #create' do
      context 'todoのtextが入力されてるとき' do
        it 'TODOが作成できること' do
        end
      end
    end

    describe 'DELETE #destroy' do
      context '存在するTODOを削除したとき' do
        it 'TODOの削除ができること' do
        end
      end
    end
  end

  # 異常系
  describe '異常系' do
    describe 'GET #show' do
      context '存在しないTODOにアクセスしたとき' do
        it 'エラーになること' do
        end
      end
    end

    describe 'GET #edit' do
      context '存在しないTODOを編集したとき' do
        it 'エラーになること' do
        end
      end
    end

    describe 'POST #create' do
      context 'todoのtextが入力されていないとき' do
        it 'TODOが作成できないこと' do
        end
      end
    end

    describe 'DELETE #destroy' do
      context '存在しないTODOを削除したとき' do
        it 'エラーになること' do
        end
      end
    end
  end
end
