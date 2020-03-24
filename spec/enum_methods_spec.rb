require './enum_methods'

RSpec.describe Enumerable do
  let(:arr_1) {[1, 2, 3, 4, 5]}
  let(:arr_2) {[1, 2, nil, 4,]}
  let(:arr_3) {["cat", 3, true, "board",]}
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
    context 'if no block given return true if none of object values is nil or false' do
      it {expect(arr_1.my_all?).to eq(true)}
      it {expect([].my_all?).to eq(true) }
    end
    context 'if no block given return false if none one the object values is nil or false' do
      it {expect(arr_2.my_all?).to eq(false)}
    end
    context 'if argument is Regular expression return true if all objects contain it' do
      it {expect(%w[ant beat cat].my_all?(/t/)).to eq(true)}
    end
    context 'if argument is Class return true if all objects are of that class' do
      it {expect(arr_1.my_all?(Integer)).to eq(true)}
    end
  end

  describe '#my_any?' do 
    context 'if no block given return true if atleast one of object values is not nil or false' do
      it {expect(arr_2.my_any?).to eq(true)}
    end
    context 'if argument is Regular expression return true if any objects contain it' do
      it {expect(%w[dog bear cat].my_any?(/t/)).to eq(true)}
    end
    context 'if argument is Class return true if any object is of that class' do
      it {expect(arr_1.my_any?(Integer)).to eq(true)}
    end
    context 'if no block given and object is empty return false' do
      it {expect([].my_any?).to eq(false)}
    end
  end

  describe '#my_none?' do
    context 'if no block given return true only if none of collection members is true' do
      it {expect([nil, false].my_none?).to eq(true)}
    end
    context 'if argument is Regular expression return false if all any value of object contains it' do
      it {expect(%w[ant beat cat].my_none?(/t/)).to eq(false)}
    end
    context 'if argument is Class return true if all any value of object is not of that class' do
      it {expect(%w[ant beat cat].my_none?Integer).to eq(true)}
    end
    context 'if no block given and object is empty return true' do
      it {expect([].my_none?).to eq(true)}
    end
  end

end
