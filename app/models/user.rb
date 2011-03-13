class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role_ids
  
  has_many :articles, :foreign_key => "author_id"
  has_many :comments, :foreign_key => "author_id"
  has_many :assignments
  has_many :roles, :through => :assignments
  
  validates :name, :presence => true
  
  before_save :setup_role
  
  def role?(role)
    roles.include?(Role.find_by_name(role.to_s))
  end
  
  def setup_role
    if roles.empty?
      roles << Role.find_by_name(:member)
    end
  end
end
