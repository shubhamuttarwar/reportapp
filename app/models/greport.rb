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

   # def self.import(file)
     # CSV.foreach(file.path, headers: true) do |row|
       # Greport.create! row.to_hash

     # end
  # end
       def self.import(file)
         category_attributes = ["roll","name", "marksobt", "marksout", "percent", "year", "exam", "sem", "session", "batch", "result","sgpa" ]
         CSV.foreach(file.path, headers: true) do |row|
         #item = where(id: row["id"])
          # .first_or_create!(row.to_hash.slice(*category_attributes))
           item = find_by_id(row["id"]) || new
           item.attributes = row.to_hash.slice(*category_attributes)
         item.save!
         end
      end


  def self.total_passed()
    pass=0
      Greport.find_each do |user|
        (
          string = user.result
          if(string == "Pass"|| string == "pass") then
            pass=pass+1
          end
        )
      end
    return pass
  end


  def self.total_failed()
    failed=0
      Greport.find_each do |user|
       (
          string = user.result
          if(string == "Fail"|| string == "fail") then
            failed=failed+1
          end
          )
      end
    return failed
  end


  def self.toppers()
    arrayobj=[]
    x=0
    Greport.all.order(percent: :desc)
    Greport.first(3).each do |user|
        arrayobj[x]=user.percent
        x=x+1
    end
    return arrayobj
  end

    def self.toppernames()
    obarray=[]
    y=0
    Greport.all.order(percent: :desc)
    Greport.first(3).each do |user|
      obarray[y]=user.name
      y=y+1
    end
    return obarray
    end

    def self.destroy
     Greport.delete_all
    end
  end
