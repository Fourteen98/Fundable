require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    Group.create(id: 1, name: 'Sneakers',
                 icon: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ficonscout.com%2Ficon%2Fsneakers-391&psig=AOvVaw1unFsDTPG7ehIYsHUsDYDV&ust=1668614951194000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCNiN7J3JsPsCFQAAAAAdAAAAABAK')
  end

  context 'Validate all fields' do
    it "Group name is 'Sneakers'" do
      expect(subject.name).to match('Sneakers')
    end

    it 'Group icon should be type of String' do
      expect(subject.icon).to be_a_kind_of(String)
    end
  end
end
