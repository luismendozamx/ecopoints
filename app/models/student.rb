class Student < ActiveRecord::Base
  def self.search(query)
    where("clave_unica = ?", "#{query}")
  end
end
