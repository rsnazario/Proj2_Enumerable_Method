require './enum_methods'

RSpec.describe Enumerable do
  let(:arr_1) {[1, 2, 3, 4, 5]}
  let(:arr_string1) {%w[cat dog wombat]}

  describe '#my_each' do
    context "return array if block given" do
      it {expect(arr_1.my_each{|a| a}).to eq(arr_1)}
    end
    context "if no block given return enumerator" do
      it {expect(arr_1.my_each).to be_a(Enumerator)}
    end
  end

  describe '#my_each_with_index' do
    context 'if no block given return enumerator' do
      it {expect(arr_1.my_each_with_index).to be_a(Enumerator)}
    end
    context 'return object after application of block given requirements' do
      hash = Hash.new
      it { expect( arr_string1.my_each_with_index {|item, value| hash[item] = value} ).to eq(arr_string1) }
    end
  end

  describe '#my_select' do
    context 'if no block given return enumerator' do
      it {expect(arr_1.my_select).to be_a(Enumerator)}
    end
    context 'if block given return array containing elements of the original array that meets condition provided' do
      it 'returns even numbers' do 
        expect(arr_1.my_select{|i| i % 2  == 0}).to eq([2, 4])
      end
      it 'returns odd numbers' do 
        expect(arr_1.my_select{|i| i % 2  != 0}).to eq([1, 3, 5])
      end
      it 'returns words with the required length' do
        expect(arr_string1.my_select{|word| word.length == 3}).to eq(["cat", "dog"])
      end
    end
  end

  describe '#my_all?' do
    

  end

end
