# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  access_token :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ApiKey < ApplicationRecord

  before_create :generate_access_token

  private

  def generate_access_token
    self.access_token = SecureRandom.urlsafe_base64(24)
  end

end
