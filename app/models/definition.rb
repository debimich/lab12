class Definition < ApplicationRecord
  belongs_to :User
  validates :User, presence: { message: 'Идентификатор пользователя не может быть пустым' }
  validates :def, presence: { message: 'Текст определения не может быть пустым' }
  validates :def, uniqueness: { message: 'Данное определение уже существует'  }
  has_many :Values, dependent: :destroy
end
