class Lead < ActiveRecord::Base
  belongs_to :member, :foreign_key => "owner"
  # Mass Assignment Protection
  attr_accessible :firstname, :lastname, :title, :company, :status, :phone, :email, :ratting,
                  :website, :street, :city, :state, :zip, :country, :annual_revenue, :employee_no,
                  :lead_source, :description, :owner, :unique_id

  # Validations for Users
  validates_presence_of :lastname, :company, :status, :email
  validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email

  def self.search_leads(search_leads, sort_column, sort_direction)
    Lead.where('lastname LIKE  ?', "%#{search_leads}%").order(sort_column+ " "+sort_direction)
  end

end
