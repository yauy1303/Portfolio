class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  # 検索機能、カラム
  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

end
