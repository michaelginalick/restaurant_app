class Restaurant < ApplicationRecord
# == Schema Information
#
# Table name: restaurants
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  description        :string(255)      not null
#  address            :string(255)      not null
#  rating             :float            not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


  has_many :menu_items
  validates :name, :description, :address, :rating, presence: true
  validates :rating, :inclusion => 0.0..5.0

  def self.paged_search(page_params)
    arel = Restaurant
    if page_params[:all]
      page_params[:number] = 1
      page_params[:size] = arel.distinct.count
    else
      page_params[:number] ||= 1
      page_params[:size] ||= DEFAULT_PAGE_SIZE
    end
    arel.page(page_params.fetch(:number)).per(page_params.fetch(:size))
  end

end
