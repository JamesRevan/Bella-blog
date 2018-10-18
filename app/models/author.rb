# == Schema Information
#
# Table name: authors
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable #:registerable,
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  validates_presence_of :name, on: :update

  def change_password(attributes)
    update(password: attributes[:new_password], password_confirmation: attributes[:new_password_confirmation])
end

end
