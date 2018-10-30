# NOTE: just a form object for now, ref: https://robots.thoughtbot.com/activemodel-form-objects
class Company
  include ActiveModel::Model

  attr_accessor :company_name, :website, :image_url, :additional_comments
  validates :company_name, :website, :image_url, presence: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "Company")
  end
end
