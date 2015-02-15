class Chirp < ActiveRecord::Base
   paginates_per 8
   belongs_to :user

   def self.timeline(user)
    follower_ids = user.following_users.map(&:id)
    all_ids= follower_ids << user.id
    Chirp.where(user_id: all_ids).order("created_at DESC")
  end

end
