namespace :data do
  desc "Import CSV files"
  
  task :import => :environment do
    puts "Importing CSV..."
    
    File.open("data/fop_test.csv") do |f|
      f.each_line do |line|

        id, fio, addr, cat, status = line.split(";").map {|w| w.gsub('"', '').strip}    
        person = Person.new
        person.fullname = fio
        person.address = addr
             
        cat_code, cat_name = cat.split(' ', 2)
        category = Category.find_or_create_by(code: cat_code, name: cat_name)
                
        person.status = status
        person.save
        
      end
    end
    
  end

end

