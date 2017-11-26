class Schedule < ApplicationRecord
  include Fae::BaseModelConcern

  has_many :service_schedules, dependent: :destroy
  has_many :services, through: :service_schedules
  belongs_to :client

  validates :date, presence: true
  validates :hour, presence: true
  validates :services, presence: true
  validates :status, presence: true
  validates :client, presence: true

  enum status: { scheduled: 1, finished: 2, canceled: 3 }

  def self.for_fae_index
    order(:date)
  end

  def fae_display_field
    date
  end



end
