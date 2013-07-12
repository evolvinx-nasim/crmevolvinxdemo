class Account < ActiveRecord::Base
  has_many :contact, :dependent => :delete_all, :foreign_key => 'account_name'
  belongs_to :member, :foreign_key => "owner"
  # Mass Assignment Protection
  attr_accessible :account_name, :status, :phone, :fax, :website, :discount, :type, :industry, :employees, :annual_revenue, :description,
                  :b_street, :b_city, :b_state, :b_zip, :b_country,
                  :s_street, :s_city, :s_state, :s_zip, :s_country, :owner,:unique_id

  # Validations for Users
  validates_presence_of :account_name
  validates_uniqueness_of :account_name
end
