class NotificationsController < ApplicationController
 before_action :authenticate_user!

 def index
  @notifications = Notification.where(recipient_id: current_user.id).order(created_at: :desc).includes({comment: [:blog_id]})
  @notifications.update_all(read: true)
 end
 
 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:status, :originator_id, :recipient_id, :item_id, :navi_id)
    end
end
