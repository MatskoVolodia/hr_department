class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_path, notice: exception.message }
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    render file: 'public/404.html', status: 404
  end

  def pagination_params
    {
      page:     params[:page],
      per_page: 5
    }
  end
end
