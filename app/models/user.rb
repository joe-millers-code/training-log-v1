class User < ApplicationRecord
    has_many :logs, dependent: :destroy
end