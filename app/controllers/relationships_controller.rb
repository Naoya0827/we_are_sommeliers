class RelationshipsController < ApplicationController
 before_action :authenticate_user!
  def create
    followed = current_user.relationships.build(follower_id: params[:user_id])
    followed.save
    redirect_to request.referrer
  end

  def destroy
    followed = current_user.relationships.find_by(follower_id: params[:user_id])
    followed.destroy
    redirect_to request.referrer
  end
  before_action :check_guest, only: :destroy
  def check_guest
   if resource.email == 'guest@example.com'
     redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
   end
  end
end
