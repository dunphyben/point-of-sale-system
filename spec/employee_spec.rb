require 'spec_helper'

describe Employee do
  it { should have_many :products }
  it { should have_many :sales }
  it { should have_many :cashier_logs }
end
