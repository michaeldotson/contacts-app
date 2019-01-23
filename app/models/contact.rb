class Contact < ApplicationRecord

  def full_name
    "#{first_name} #{"last_name"}"
  end

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def friendly_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def japanese_country_code
    "+81 #{phone}"
  end

end
