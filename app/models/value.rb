class Value < ApplicationRecord
  belongs_to :User
  belongs_to :Definition
  validates :User, presence: { message: 'Идентификатор пользователя не может быть пустым' }
  validates :Definition, presence: { message: 'Идентификатор  определения не может быть пустым' }
  validates :val, presence: { message: 'Текст значения не может быть пустым' }
  validates :val, uniqueness: { message: 'Данное значение уже существует'  }
end
