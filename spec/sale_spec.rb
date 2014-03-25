require 'spec_helper'

describe Sale do
  it { should belong_to :employee }
  it { should belong_to :product }
end
