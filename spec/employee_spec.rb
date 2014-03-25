require 'spec_helper'

describe Employee do
  it { should have_many :product }
  it { should have_many :sale }
end
