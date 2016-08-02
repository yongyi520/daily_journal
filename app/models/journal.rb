class Journal < ActiveRecord::Base
  has_many :wins, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :metrics, dependent: :destroy

  accepts_nested_attributes_for :wins, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :lessons, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :metrics, reject_if: :all_blank, allow_destroy: true

  belongs_to :user

end
