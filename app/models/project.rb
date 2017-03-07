class Project < ApplicationRecord
  belongs_to :user
  belongs_to :project_approver, optional: true, class_name: 'User', foreign_key: 'project_approver_id'
  belongs_to :project_manager, optional: true, class_name: 'User', foreign_key: 'project_manager_id'
end
