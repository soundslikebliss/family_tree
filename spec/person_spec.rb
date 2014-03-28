require 'spec_helper'

describe Person do
  it { should validate_presence_of :name }

  context '#spouse' do
    it 'returns the person with their spouse_id' do
      earl = Person.create(:name => 'Earl')
      steve = Person.create(:name => 'Steve')
      steve.update(:spouse_id => earl.id)
      steve.spouse.should eq earl
    end

    it "is nil if they aren't married" do
      earl = Person.create(:name => 'Earl')
      earl.spouse.should be_nil
    end
  end

  context '#child' do
    it 'returns the person with their child_id' do
      earl = Person.create(name: 'Earl')
      johnny = Person.create(name: 'Johnny')
      earl.update(child_id: johnny.id)
      earl.child.should eq johnny
    end
  end

  context '#father' do
    it 'returns the person with their father_id' do
      bill = Person.create(name: 'Bill')
      nancy = Person.create(name: 'Nancy', father_id: bill.id)
      nancy.father.should eq bill
    end
  end

  context '#mother' do
    it 'returns the person with their mother_id' do
      suzy = Person.create(name: 'Suzy')
      nancy = Person.create(name: 'Nancy', mother_id: suzy.id)
      nancy.mother.should eq suzy
    end
  end

  it "updates the spouse's id when it's spouse_id is changed" do
    earl = Person.create(:name => 'Earl')
    steve = Person.create(:name => 'Steve')
    steve.update(:spouse_id => earl.id)
    earl.reload
    earl.spouse_id.should eq steve.id
  end
end
