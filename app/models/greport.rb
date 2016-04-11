class Greport < ActiveRecord::Base
  belongs_to :user
  validates :roll, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 20}
  validates :marksobt, presence: true
  validates :marksout, presence: true
  validates :percent, presence: true
  validates :year, presence: true
  validates :exam, presence: true
  validates :sem, presence: true
  validates :session, presence: true
  validates :batch, presence: true
  validates :result, presence: true
  validates :sgpa, presence: true
  #validates :user_id, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Greport.create! row.to_hash

    end
 end
end
