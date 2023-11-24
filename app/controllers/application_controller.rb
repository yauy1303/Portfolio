class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 検索機能
  before_action :set_article_search

  def set_article_search
     @q = Article.ransack(params[:q])
     @articles = @q.result
  end

  # ログイン後にマイページへ遷移
  def after_sign_in_path_for(resource)
    member_path(@member.id)
  end

  protected

  # devise nameの入力許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
