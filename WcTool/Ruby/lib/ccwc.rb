class Ccwc
  def analize(file_path, option=nil)
    @file_data = read_file(file_path)

    case option
    when '-c'
      "#{get_bytes()} #{file_path}"
    when '-l'
      "#{get_number_of_lines()} #{file_path}"
    when '-w'
    "#{get_number_of_words()} #{file_path}"
    when '-m'
    "#{get_number_of_characters()} #{file_path}"
    when nil
      "#{get_bytes()} #{get_number_of_lines()} #{get_number_of_words()} #{get_number_of_characters()} #{file_path}"
    else
      raise "Invalid option"
    end
  end

  private
  def read_file(file_path)
    begin
      File.read(file_path, encoding: 'utf-8')
    rescue => e
      raise "ccwc: #{e.message}"
    end
  end


  def get_bytes
    @file_data.bytesize
  end

  def get_number_of_lines
    @file_data.split("\n").length
  end

  def get_number_of_words
    @file_data.split(" ").length
  end

  def get_number_of_characters
    @file_data.size
  end

end
