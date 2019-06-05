class Test < ApplicationRecord

 serialize :question, Array
 serialize :answer, Array

 validates :title, presence: true, on: :create
 validates :points, presence: true, on: :create
 validates :question, presence: true, on: :update
 validates :answer, presence: true, on: :update
end
