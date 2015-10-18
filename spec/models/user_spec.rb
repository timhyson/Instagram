require 'rails_helper'

describe User, :type => :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :commented_photos }
end
