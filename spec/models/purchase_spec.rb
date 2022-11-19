require 'rails_helper'

RSpec.describe Purchase, type: :model do
  subject do
    Purchase.create(id: 1, name: 'Yeezy Boost 1', amount: 200, author_id: 1)
  end

  context 'Validation shoulb be working' do
    it "Purchase name is 'Yeezy Boost 1'" do
      expect(subject.name).to match('Yeezy Boost 1')
    end
    it "Purchase amount is '200'" do
      expect(subject.amount).to match(200)
    end

    it "Purchase author_id is '1'" do
      expect(subject.author_id).to match(1)
    end
  end
end
