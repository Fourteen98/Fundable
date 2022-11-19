require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Bobby Freeman', email: 'test@example.com', password: 'password',
                password_confirmation: 'password')
  end

  context 'Validations should be working' do
    it 'All validations should return true' do
      expect(subject).to be_valid
    end

    it 'Name validation should return false' do
      subject.name = 'abraha'
      expect(subject).to be_valid
    end

    it 'Name should be of type string' do
      expect(subject.name).to be_a_kind_of(String)
    end
  end
end
