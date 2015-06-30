Spree::Product.class_eval do
  has_many :videos, -> { order "position desc" }, :as => :watchable
end