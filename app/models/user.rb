class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_one :approval
  has_one :approver, :through => :approval
  # i dont think i need this .. but lets see.
  # has_one :project_approver, :through => :projects
  # has_one :project_manager, :through => :projects
  
end
