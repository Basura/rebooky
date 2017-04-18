class PeakSeasonsProperty < ApplicationRecord

  belongs_to :property, inverse_of: :properties_peak_seasons
end