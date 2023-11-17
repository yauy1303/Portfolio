class SessionsController < Devise::SessionsController
  before_action :reject_member, only: [:create]

  # ゲストログイン
  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to root_path, notice: 'ゲストとしてログインしました。'
  end

end
