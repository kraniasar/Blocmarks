require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:topics) }
  it { should have_many(:bookmarks) }
end
