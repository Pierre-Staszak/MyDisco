class Score < ApplicationRecord
  enum state: [:uninteresting, :not_very_good, :ok, :good, :masterpiece]
end
