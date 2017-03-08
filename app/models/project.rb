class Project < ApplicationRecord
  attachment :project_file
  attachment :project_photo
  attachment :project_proposal
  attachment :project_profile_picture

  belongs_to :user
  belongs_to :project_approver, optional: true, class_name: 'User', foreign_key: 'project_approver_id'
  belongs_to :project_manager, optional: true, class_name: 'User', foreign_key: 'project_manager_id'

  has_one :status_project
  has_many :project_followings
  has_many :followers, through: :project_followings
  has_many :project_files, dependent: :destroy
  has_many :project_photos, dependent: :destroy

  accepts_attachments_for :project_files
  accepts_attachments_for :project_photos

end
