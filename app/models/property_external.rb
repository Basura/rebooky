class PropertyExternal < ApplicationRecord
  belongs_to :property

  validates :external_id, presence: true
  validates :entity, presence: true, inclusion: { in: ['vrbo'] }

  scope :vrbo, -> { where entity: :vrbo }
end
