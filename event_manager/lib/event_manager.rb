require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def find_peak_day(date,hash)
  hash[date[0]] += 1

  best_day = hash.sort[0][0]
  best_day
end

def find_best_hour(date, hash)
end

def find_day_of_week(date)
end
def clean_phone_numbers(phone_number)
  phone = phone_number.gsub(/[\.\s\-\_\(\)]/ , '')

  if phone.length < 10 || phone.length > 11
    "Bad number"
  elsif phone.length == 11
    phone[0] == '1' ? phone[1..10] : "Bad number"
  else 
    phone
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
                                  address: zip,
                                  levels: 'country',
                                  roles: ['legislatorUpperBody', 'legislatorLowerBody'])
    legislators = legislators.officials
    legislator_names = legislators.map(&:name)
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exists? 'output'

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts personal_letter
  end
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

peak_day_hash = Hash.new(0)
best_day = ''
contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  phone_number = clean_phone_numbers(row[:homephone])


  date = row[:regdate].split(' ')

  find_peak_day(date,peak_day_hash)

  best_day = find_peak_day(date,peak_day_hash)
  #legislators = legislators_by_zipcode(zipcode)

  #personal_letter = erb_template.result(binding) 
  
  #save_thank_you_latter(id, personal_letter)
end

