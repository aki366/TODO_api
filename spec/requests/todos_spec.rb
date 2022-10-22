require 'rails_helper'

RSpec.describe "Todos Request", type: :request do

  # 正常系
  describe '正常系' do
    describe 'GET #show' do
      let!(:todo) { create(:todo) }

      before { get "/api/todos/#{todo.id}" }

      context '存在するTODOにアクセスしたとき' do
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

      before { get "/api/todos" }

      context 'TODOが作成されているとき' do
        it 'responseのステータスが200であること' do
          expect(response).to have_http_status(200)
        end
        it 'responseの中身が正しいこと' do
          json = JSON.parse(response.body)
          expect(json.count).to eq 1
          expect(json[0]['id']).to eq todo.id
          expect(json[0]['text']).to eq todo.text
          expect(json[0]['created_at']).not_to be nil
          expect(json[0]['updated_at']).not_to be nil
        end
      end
    end

    describe 'PUT #update' do
      let!(:todo) { create(:todo) }

      context '存在するTODOを編集したとき' do
        it 'responsが正常であること' do
          expect do
            put "/api/todos/#{todo.id}",
            params: { todo: {text: "TODOを編集しました"} }
          end.to change { Todo.find(1).text }

          expect(response).to have_http_status(200)
          expect(Todo.find(1).text).to eq "TODOを編集しました"
          expect(Todo.find(1).id).to eq todo.id
          expect(Todo.find(1).created_at).not_to be nil
          expect(Todo.find(1).updated_at).not_to be nil
        end
      end
    end

    describe 'POST #create' do
      it 'TODOが作成できること' do
        expect do
          post "/api/todos", params: { todo: attributes_for(:todo) }
        end.to change(Todo, :count).by(+1)
        expect(response).to have_http_status(200)
      end
    end

    describe 'DELETE #destroy' do
      let!(:todo) { create(:todo) }

      context '存在するTODOを削除したとき' do
        it 'TODOが削除できること' do
          expect do
            delete "/api/todos/#{todo.id}"
          end.to change(Todo, :count).by(-1)
          expect(response).to have_http_status(200)
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

      context 'Excepionエラーの場合' do
        let!(:error) { Exception.new }
        it 'エラーになること' do
          expect(response).to have_http_status(500)
        end
      end
    end

    describe 'GET #index' do
      let!(:todo) { create(:todo) }

      before do
        allow(Todo).to receive(:all).and_raise(error)
        get "/api/todos"
      end

      context 'レコードが存在しない場合' do
        let!(:error) { ActiveRecord::RecordNotFound.new }
        it 'エラーになること' do
          expect(response).to have_http_status(404)
        end
      end

      context 'Excepionエラーの場合' do
        let!(:error) { Exception.new }
        it 'エラーになること' do
          expect(response).to have_http_status(500)
        end
      end
    end

    describe 'PUT #update' do
      let!(:todo) { create(:todo) }

      before do
        allow(Todo).to receive(:find).and_raise(error)
        put "/api/todos/#{todo.id}"
      end

      context 'レコードが存在しない場合' do
        let!(:error) { ActiveRecord::RecordNotFound.new }
        it 'エラーになること' do
          expect(response).to have_http_status(404)
        end
      end

      context 'Excepionエラーの場合' do
        let!(:error) { Exception.new }
        it 'エラーになること' do
          expect(response).to have_http_status(500)
        end
      end
    end

    describe 'POST #create' do
      let!(:todo) { create(:todo) }

      before do
        allow(Todo).to receive(:new).and_raise(error)
        post "/api/todos"
      end

      context 'Excepionエラーの場合' do
        let!(:error) { Exception.new }
        it 'エラーになること' do
          expect(response).to have_http_status(500)
        end
      end
    end

    describe 'DELETE #destroy' do
      let!(:todo) { create(:todo) }

      before do
        allow(Todo).to receive(:find).and_raise(error)
        delete "/api/todos/#{todo.id}"
      end

      context 'レコードが存在しない場合' do
        let!(:error) { ActiveRecord::RecordNotFound.new }
        it 'エラーになること' do
          expect(response).to have_http_status(404)
        end
      end

      context 'Excepionエラーの場合' do
        let!(:error) { Exception.new }
        it 'エラーになること' do
          expect(response).to have_http_status(500)
        end
      end
    end
  end
end
