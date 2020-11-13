# rubocop:disable Style/RedundantReturn
require_relative '../lib/search.rb'
require_relative '../lib/display.rb'

def check_answer(user_answer)
  if user_answer == 'y'
    puts 'What are you searching for?'
    runscript
  elsif user_answer == 'n'
    puts 'Thank you for using our Scrapper!'
    return false
  elsif user_answer != 'y' && user_answer != 'n'
    print 'Invalid answer! Please answer with [Y] or [N]. Do you want to make a new search? '
    rerun(gets.downcase.chomp)
  end
end

def show_results(list)
  result = Table.new(list[0], list[1], list[2], list[3])
  print ' POSITION ' + '                      DESCRIPTION                                  '
  print '                               LINK                            '
  print '  SIZE         SEEDS      '
  puts ''
  table = result.build_table
  puts table
  sleep(1)
end

def runscript
  search = Search.new(gets.chomp)
  show_results(search.result)
  print('Do you want to make a new search? [Y]es or [N]o? ')
  check_answer(gets.chomp)
end
puts 'This is a Web Scraper for ThePirateBay.org, which is a torrent search website!'
puts 'Type whatever you want to search and the Scraper will retrieve the information found at ThePirateBay.org'
puts 'What are you searching for?'
runscript
# rubocop:enable Style/RedundantReturn
