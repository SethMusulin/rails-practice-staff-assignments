class Person < ActiveRecord::Base

  validate :first_name_or_title


  def first_name_or_title
    if last_name.blank? && first_name.blank? && title.blank?
      errors.add(:last_name, "You must enter a title/last name, or a first/last name")
    elsif !last_name.blank? && first_name.blank? && title.blank?
      errors.add(:last_name, "You must enter a title/last name, or a first/last name")
    end

  end
end