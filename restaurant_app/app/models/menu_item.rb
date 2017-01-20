class MenuItem < ApplicationRecord
  # == Schema Information
  #
  # Table name: menu_items
  #
  #  id                 :integer          not null, primary key
  #  name               :string(255)      not null
  #  description        :string(255)      not null
  #  category           :string(255)      not null
  #  restaurant_id      :integer          not null
  #  created_at         :datetime         not null
  #  updated_at         :datetime         not null
  #

  belongs_to :restaurant
  has_many   :tags

  validates :description, :category, :name, :restaurant_id, presence: true
  validates :category, inclusion: { in: %w(entree appetizer dessert beverage side) }, presence: true

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  DEFAULT_PAGE_SIZE = 10
  def self.paged_search(search_params, page_params)
    arel = MenuItem
    arel = arel.where(restaurant_id: search_params[:restaurant_id])

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
