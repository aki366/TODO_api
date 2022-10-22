require 'rails_helper'

RSpec.describe "Api::Comments", type: :request do

  describe '正常系' do
    describe 'GET #show' do
      context 'TODOに紐づくCommentにアクセスしたとき' do
        it 'statusが200になること' do
        end
        it 'responseの中身が正しいこと' do
        end
      end
    end

    describe 'GET #index' do
      context 'TODOに紐づく複数のCommentがあるとき' do
        it 'statusが200になること' do
        end
        it 'responseの中身が正しいこと' do
        end
      end
    end

    describe 'PUT #update' do
      context 'Commentを編集したとき' do
        it 'responsが正常であること' do
        end
      end
    end

    describe 'POST #create' do
      context '存在するTODOに紐づくCommentを作成したとき' do
        it 'statusが200になること' do
        end

        it 'responseの中身が正しいこと' do
        end
      end
    end

    describe 'DELETE #destroy' do
      context 'Commentを削除したとき' do
        it 'statusが200になること' do
        end

        it 'Commentが削除できること' do
        end
      end

      context 'Commentに紐づくTODOが削除されたとき' do
        it 'statusが200になること' do
        end

        it 'Commentが削除されること' do
        end
      end
    end
  end

  describe '異常系' do
    describe 'GET #show' do
      context 'レコードが存在しない場合' do
        it 'statusが404になること' do
        end
      end

      context 'Excepionエラーの場合' do
        it 'statusが500になること' do
        end
      end
    end

    describe 'GET #index' do
      context 'Excepionエラーの場合' do
        it 'statusが500になること' do
        end
      end
    end

    describe 'PUT #update' do
      context 'レコードが存在しない場合' do
        it 'statusが404になること' do
        end
      end

      context 'Excepionエラーの場合' do
        it 'statusが500になること' do
        end
      end
    end

    describe 'POST #create' do
      context 'Excepionエラーの場合' do
        it 'statusが500になること' do
        end
      end
    end

    describe 'DELETE #destroy' do
      context 'レコードが存在しない場合' do
        it 'statusが404になること' do
        end
      end

      context 'Excepionエラーの場合' do
        it 'statusが500になること' do
        end
      end
    end
  end
end
