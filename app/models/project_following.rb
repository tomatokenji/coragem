class ProjectFollowing < ApplicationRecord
  belongs_to :following_project, :class_name => 'Project', :foreign_key => 'following_project_id'
  belongs_to :follower, :class_name => 'User', :foreign_key => 'follower_id'

end
