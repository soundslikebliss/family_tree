class Person < ActiveRecord::Base
  validates :name, :presence => true

  after_save :make_marriage_reciprocal


  def spouse
    if spouse_id.nil?
      nil
    else
      Person.find(spouse_id)
    end
  end

  def child
    if child_id.nil?
      nil
    else
      Person.find(child_id)
    end
  end

  def father
    if father_id.nil?
      nil
    else
      Person.find(father_id)
    end
  end

  def mother
    if mother_id.nil?
      nil
    else
      Person.find(mother_id)
    end
  end

private

  def make_marriage_reciprocal
    if spouse_id_changed?
      spouse.update(:spouse_id => id)
    end
  end
end
