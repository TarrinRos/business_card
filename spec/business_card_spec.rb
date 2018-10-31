require 'rspec'
require 'business_card'

describe BusinessCard do
  subject (:business_card) {BusinessCard.get_data('spec/fixtures/sample_business_card.json')}

  describe '.get_data' do
    it 'creates instance of BusinessCard' do
      expect(business_card).to be_an_instance_of(BusinessCard)
    end

    it 'parses json data from a file' do
      expect(business_card.parsed_data).to be_an_instance_of(Hash)
    end

    it 'assings instance variables from params' do
      expect(business_card.first_name).to eq 'Tester'
      expect(business_card.last_name).to eq 'Testov'
      expect(business_card.phone).to eq '1234'
      expect(business_card.email).to eq 'test@test.ts'
      expect(business_card.job).to eq 'Tester of the tests'
    end
  end

  describe '#to_s' do
    it 'returns string with data' do
      expect(business_card.to_s).to eq "Tester Testov\nphone: 1234, email: test@test.ts \nTester of the tests\n"
    end
  end
end