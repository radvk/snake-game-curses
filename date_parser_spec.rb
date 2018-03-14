require_relative 'date_parser'
RSpec.describe DateParser do
  describe '#dodawanie' do
    context 'when x greater or equal 60' do
      it 'returns min and sec' do
        x = 100

        result = DateParser.new(x).call

        expect(result).to eq '01 : 40'
      end
    end

    context 'when x greater or equal 3600' do
      it 'returns hours, min, sec' do
        x = 3750

        result = DateParser.new(x).call

        expect(result).to eq '01 : 02 : 30'
      end
    end

    context 'when x less than 60' do
      it 'parses time to sec' do
        x = 30

        result = DateParser.new(x).call

        expect(result).to eq '30'
      end
    end
  end
end

=begin
  że parser będzie dostawał jakiegoś integera / floata - jak wolisz
i będzie zwracał sformatowany czas
100 => 1 : 40
30 => 30
3750 => 1 : 02 : 30
=end