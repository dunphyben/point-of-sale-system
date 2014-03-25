require 'spec_helper'

describe Product do
  it { should have_many :employees }
  it { should have_many :sales }
  it { should belong_to :category }
end
