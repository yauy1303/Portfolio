class SessionsController < Devise::SessionsController

  # ゲストログイン
  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to root_path, notice: 'ゲストとしてログインしました。'
  end

end
