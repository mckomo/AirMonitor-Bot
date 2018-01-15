require 'spec_helper'
require 'lib/rom'
require 'lib/user_repository'

RSpec.describe UserRepository do
  subject { described_class.new(CONTAINER) }

  it 'works' do
    subject.create(messenger_id: '123', state: 'initial')
    subject.users.where(messenger_id: '123').first
  end
end
