class Task < ApplicationRecord
  belongs_to(:user)
  belongs_to(:assignee, class_name: "User", optional: true)
end
