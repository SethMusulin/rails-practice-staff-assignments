class Person < ActiveRecord::Base

  has_many :assignments

  validate :first_name_or_title


  def first_name_or_title
    if last_name.blank? && first_name.blank? && title.blank?
      errors.add(:base, "You must enter a title/last name, or a first/last name")
    elsif !last_name.blank? && first_name.blank? && title.blank?
      errors.add(:base, "You must enter a title/last name, or a first/last name")
    elsif last_name.blank?
      errors.add(:base, "You must enter a title/last name, or a first/last name")
    end

  end
end