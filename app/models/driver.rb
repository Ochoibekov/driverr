class Driver < ApplicationRecord
	has_many :comments
	searchkick word_start: %i[passport_number pin]
	def search_data
    {
      pin: pin,
      passport_number: passport_number
    }
  end
end
