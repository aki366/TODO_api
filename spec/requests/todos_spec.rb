RSpec.describe "Tickets Request", type: :request do

  describe 'POST #create' do
    context 'textが入力されているとき' do
      it 'TODOが新規投稿できること' do
        expect do
          post api_v1_todos_path, params: { ticket: attributes_for(:ticket) }
        end.to change(Ticket, :count).by(+1)
        expect(response).to redirect_to(tickets_path)
      end
    end
  end

