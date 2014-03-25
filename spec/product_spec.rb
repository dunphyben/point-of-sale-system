require 'spec_helper'

describe Product do
  it { should have_many :employee }
  it { should have_many :sale }
end
