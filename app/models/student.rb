class Student < ActiveRecord::Base
  validates :email, :clave_unica, :points, presence: true
  validates :email, :clave_unica, uniqueness: true
  def self.search(query)
    where("clave_unica = ?", "#{query}")
  end
end
