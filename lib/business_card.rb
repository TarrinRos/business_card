require 'json'

class BusinessCard
  attr_reader :parsed_data, :first_name, :last_name, :phone, :email, :job

  def self.get_data(file_path)
    abort 'Файл JSON с указанным именем не найден' unless File.exist?(file_path)
    file = File.read(file_path)
    raw_data = JSON.parse(file)

    new(raw_data)
  end

  def initialize(params)
    @parsed_data = to_h(params)

    @first_name = @parsed_data['first_name']
    @last_name = @parsed_data['last_name']
    @phone = @parsed_data['phone']
    @email = @parsed_data['email']
    @job = @parsed_data['job']
  end

  def to_h(params)
    sample = %w(first_name last_name phone email job)
    params.select { |key, value|  sample.include?(key) }
  end

  def to_s
    <<~EOM
      #{@first_name} #{@last_name}
      phone: #{@phone}, email: #{@email} 
      #{@job}
    EOM
  end
end