require_relative '../lib/ccwc'

describe Ccwc do

  it 'should output all details without option' do
    output = Ccwc.new().analize('test.txt')
    expect(output).to eql('342190 7145 58164 339292 test.txt') 
  end

  it 'should output number of bytes ' do
    output = Ccwc.new().analize('test.txt', '-c')
    expect(output).to eql('342190 test.txt') 
  end

  it 'should output number of lines ' do
    output = Ccwc.new().analize('test.txt', '-l')
    expect(output).to eql('7145 test.txt') 
  end

  it 'should output number of characters ' do
    output = Ccwc.new().analize('test.txt', '-m')
    expect(output).to eql('339292 test.txt') 
  end
end
