class Notification < ApplicationRecord
  belongs_to :user

  @@NOTIFICATION_TYPES = {LIKES: "likes",COMMENTS:"comments",FOLLOW:"follow",UNFOLLOW:"unfollow",ACCEPTANCE:"follow_acceptance"}

  # getter
  def self.NOTIFICATION_TYPES
    @@NOTIFICATION_TYPES
  end
  
  def self.create_notification(parameters)
    notification=Notification.new(user_id:parameters[:user_id],actor_id:parameters[:actor_id],notification_type:parameters[:notification_type],target_type:parameters[:target_type],target_id:parameters[:target_id])
    notification.save
  end
end
