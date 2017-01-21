class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  DEFAULT_PAGE_SIZE = 10
end
