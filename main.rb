# Lesson33, task1
# ========================================
# Business card
# ========================================

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require './lib/business_card.rb'

current_path = File.dirname(__FILE__)

file_path = "#{current_path}/data/business_card.json"

business_card = BusinessCard.get_data(file_path)

puts business_card
