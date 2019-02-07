class Contact < ApplicationRecord

  validates :first_name, :last_name, :email, presence: true, length: { minimum: 2 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_many :contact_groups
  has_many :groups, through: :contact_groups
  belongs_to :user


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

  def group_names
    groups.map {|group| group.name}
  end

end
