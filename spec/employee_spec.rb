require 'spec_helper'

describe Employee do
  it { should have_many :products }
  it { should have_many :sales }
end
