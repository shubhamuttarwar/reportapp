class Greport < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Greport.create! row.to_hash
    end
 end
end
