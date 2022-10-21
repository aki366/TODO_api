require 'rails_helper'

RSpec.describe "Todos Request", type: :request do

  # 正常系
  describe '正常系' do
    describe 'GET #show' do
      let!(:todo) { create(:todo) }
      context '存在するTODOにアクセスしたとき' do
        before { get "/api/todos/#{todo.id}" }
        it 'responseのステータスが200であること' do
          expect(response).to have_http_status(200)
        end
        it 'responseの中身が正しいこと' do
          json = JSON.parse(response.body)
          expect(json['id']).to eq todo.id
          expect(json['text']).to eq todo.text
          expect(json['created_at']).not_to be nil
          expect(json['updated_at']).not_to be nil
        end
      end
    end

    describe 'GET #index' do
      let!(:todo) { create(:todo) }
      context 'TODOが作成されているとき' do
        before { get "/api/todos" }
        it 'responseのステータスが200であること' do
          expect(response).to have_http_status(200)
        end
        it 'responseの中身が正しいこと' do
          json = JSON.parse(response.body)
          # 帰ってきたtodoの配列数が1を確認
          expect(json.count).to eq 1
          # 0番目の配列の中身が正しいことを確認
          expect(json[0]['id']).to eq todo.id
          expect(json[0]['text']).to eq todo.text
        end
      end
    end

    describe 'PUT #update' do
      let!(:todo) { create(:todo) }
      context '存在するTODOを編集したとき' do
        it 'TODOが編集できること' do
          expect do
            patch api_todo_path(todo.id), params: { todo: {text: "TODOを編集しました"} }
          end.to change { Todo.find(1).text }
          expect(response).to have_http_status(200)
        end
      end
    end

    describe 'POST #create' do
      let!(:todo) { create(:todo) }
      it 'TODOが作成できること' do
        expect do
          post api_todos_path, params: { todo: attributes_for(:todo) }
        end.to change(Todo, :count).by(+1)
        expect(response).to have_http_status(200)
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
      let!(:todo) { create(:todo) }

      before do
        allow(Todo).to receive(:find).and_raise(error)
        get "/api/todos/#{todo.id}"
      end

      context 'レコードが存在しない場合' do
        let!(:error) { ActiveRecord::RecordNotFound.new }
        it 'エラーになること' do
          expect(response).to have_http_status(404)
        end
      end

      context 'レコードが存在しない場合' do
        let!(:error) { Exception.new }
        it 'エラーになること' do
          expect(response).to have_http_status(500)
        end
      end
    end

    describe 'PUT #update' do
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
        let(:error) { ActiveRecord::RecordNotFound.new }

        before { allow(Todo).to receive(:find).and_raise(error) }

        it 'エラーになること' do
        end
      end
    end
  end
end
