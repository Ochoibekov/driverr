class Driver < ApplicationRecord
	has_one_attached :image
	has_many :comments
	searchkick word_start: %i[passport_number passport_series pin name last_name]
	def search_data
    {
      pin: pin,
      passport_number: passport_number,
      passport_series: passport_series,
      name: name,
      last_name: last_name
    }
  end
end
