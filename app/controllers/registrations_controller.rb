class RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_member, only: %i[update destroy]

  # ゲストユーザーの行動制限
  def ensure_normal_member
    if resource.email == "guest@guest"
      redirect_to root_path, alert: "ゲストユーザーは更新・削除できません"
    end
  end

end
