require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
  holiday_hash.collect do |season, holiday|
    if season == :winter
      #puts holiday
      holiday.collect do |key,value| 
        value.push(supply)
      end
    end
  end
  return holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.collect do |season, holiday|
    holiday.collect do |holi, deco|
      if holi == :memorial_day
        deco << supply
      end
    end
  end
  return holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash[season][holiday_name] = supply_array
 
  
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  arr = []
  holiday_hash.collect do |season,holidays|
    
    if season == :winter
      holidays.collect do |key, value|
        arr << value
      end
    end
  end
  return arr.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holiday_hash.collect do |season, holiday|
    puts "#{season.capitalize}:"
    holiday.collect do |holi, items|
      #holi is a string #items array
        holi = holi.to_s
        holi = holi.split("_")
        holi.each do |x|
          x.capitalize!
        end
        holi = holi.join(" ")
        #puts holi
        puts "  #{holi}: #{items.join(", ")}"
        
    end
    
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  arr = []
  holiday_hash.collect do |season, holiday|
    holiday.collect do |holi, stuff|
      if stuff.include?("BBQ")
        arr << holi
      end
    end
  end
  return arr
end







