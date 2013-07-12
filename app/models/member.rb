class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :lead, :dependent => :delete_all, :foreign_key => 'owner'
  has_many :contact, :dependent => :delete_all, :foreign_key => 'owner'
  has_many :account, :dependent => :delete_all, :foreign_key => 'owner'
  belongs_to :role
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_id, :unique_id
  validates_presence_of :role_id
  # before_create :new_user_role


  def new_user_role
    if self.role_id.nil?
      self.role_id = 3
    end
  end
  
end
