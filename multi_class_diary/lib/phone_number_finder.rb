class PhoneNumberFinder

  def initialize(diary)#diary is an instance of Diary
    @diary = diary
  end

  def extract_numbers
    # returns a list of strings representing all phone numbers stored in all diary entries
    return @diary.list.map do |entry|

      scrape_num(entry)

    end.flatten.uniq
  end

  private

  def scrape_num(entry)

    return entry.contents.scan(/0[0-9]{10}/)

  end


end
