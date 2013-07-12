class Contact < ActiveRecord::Base
  belongs_to :member, :foreign_key => "owner"
  belongs_to :account, :foreign_key => "account_name"
  # Mass Assignment Protection
  attr_accessible :firstname, :lastname, :title, :status, :phone, :email, :account_name, :position,
                  :m_street, :m_city, :m_state, :m_zip, :m_country,
                  :o_street, :o_city, :o_state, :o_zip, :o_country,:owner, :unique_id

  # Validations for Contacts
  validates_presence_of :lastname, :email
  validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email
end
