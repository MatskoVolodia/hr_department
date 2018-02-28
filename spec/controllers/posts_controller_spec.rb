require 'rails_helper'

describe PostsController do
  let(:user)    { create(:employee) }
  let(:ability) { Object.new.extend(CanCan::Ability) }

  before do
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to            receive(:current_user).and_return(user)
    allow(controller).to            receive(:current_ability).and_return(ability)

    ability.can :read, Post
  end

  describe 'GET #index' do
    it 'assigns @facade' do
      get :index

      expect(assigns(:facade)).to be_a(Posts::IndexFacade)
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }

    context 'user has rights to view' do
      before { ability.can :read, Post }

      it 'assigns @facade' do
        get :show, params: { id: post }

        expect(assigns(:facade)).to be_a(Posts::CoverageSummary)
      end
    end

    context 'user doesn\'t have to right to view' do
      before { ability.cannot :read, Post }

      it 'redirects to root_path' do
        get :show, params: { id: post }

        expect(subject).to redirect_to(root_path)
      end
    end
  end
end