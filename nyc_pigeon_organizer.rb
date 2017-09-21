require 'pry'

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def nyc_pigeon_organizer(data)
  hash = {}
  data.each do |category, options|
    options.each do |option, details|
      details.each do |detail|
        if !!hash[detail]
          if !hash[detail].key?(category)
            array = []
            array << "#{option}"
            hash[detail][category] = array
          end
          hash[detail][category] << "#{option}" if !hash[detail][category].include?"#{option}"
        else
          intermediary = {}
          array = []
          array << "#{option}"
          intermediary[category] = array
          hash[detail] = intermediary
        end
      end
    end
  end
  puts hash
  hash
end
