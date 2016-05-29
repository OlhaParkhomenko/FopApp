namespace :data do
  desc "Import CSV files"
  
  task :import => :environment do
    puts "Importing CSV..."
    
    File.open("data/fop_test.csv") do |f|
      f.each_line do |line|

        id, fio, addr, cat, status = line.split(";").map {|w| w.gsub('"', '').strip}
        fio_surname, fio_name, fio_middle_name = fio.split(' ')
        addr_zipcode, addr_region, addr_rest = addr.split(',', 3)
                     
        person = Person.find_by(name: fio_name, surname: fio_surname)
        person = Person.new unless person
        
        person.fullname = fio
        person.surname = fio_surname
        person.name = fio_name
        person.middle_name = fio_middle_name
        person.raw_address = addr
        person.zip_code = addr_zipcode
        person.address = addr_rest
        
        #person.region = Region.find_or_create_by(region_name: addr_region)     
        cat_code, cat_name = cat.split(' ', 2)
        person.category = Person.find_or_create_by(code: cat_code, name: cat_name)
                
        person.status = status
        person.save
        
      end
    end
    
  end

end

