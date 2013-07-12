class Role < ActiveRecord::Base
	has_many :member, :dependent => :delete_all, :foreign_key => 'role_id'
  validates_presence_of :name
  validates :name, :uniqueness => { :case_sensitive => false }

  
end
