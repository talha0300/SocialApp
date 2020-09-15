class Notification < ApplicationRecord
  belongs_to :user

  TYPES = {LIKES: "likes",COMMENTS:"comments",FOLLOW:"follow",UNFOLLOW:"unfollow",ACCEPTANCE:"follow_acceptance"}
  MESSAGES = {LIKES: " liked your post",COMMENTS:" left a comment on your post",FOLLOW:" sent a follow request",
    UNFOLLOW:" unfollowed you",ACCEPTANCE:" accepted your follow request"}

  def self.create_notification(parameters)
    notification = Notification.new(parameters)

    notification.save
  end

  def self.destroy_notifications(post)
    self.where(target_type:"posts").where(target_id:post[:id]).destroy_all
  end

  def self.notifications_creator(parameters)
    if parameters[:params][:controller]==="followships"
      if parameters[:params][:action]==="create"
        target_type="follow"
      elsif parameters[:params][:action]==="destroy"
        target_type="unfollow"
      else
        target_type="follow_acceptance"
      end
      if parameters[:type]==="followship"
        self.create_notification(user_id:parameters[:followship][:user_id],
          actor_id:parameters[:followship][:followee_id],notification_type:parameters[:params][:controller],
          target_type:target_type,target_id:parameters[:followship][:followee_id])
      else

        self.create_notification(user_id:parameters[:followship][:followee_id],
          actor_id:parameters[:followship][:user_id],notification_type:parameters[:params][:controller],
          target_type:target_type,target_id:parameters[:followship][:followee_id])
      end

    else
      Notification.create_notification(user_id:parameters[:post][:user_id],actor_id:parameters[:actor][:id],
        notification_type:parameters[:params][:controller],target_type:"posts",target_id:parameters[:post][:id])
    end

  end
end
