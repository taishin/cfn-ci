require 'spec_helper'

describe vpc('CFn-CI-VPC') do
  it { should exist }
  it { should be_available }
  its(:cidr_block) { should eq '10.0.0.0/16' }
  it { should have_route_table('CFn-CI-PubRT') }
end

describe subnet('CFn-CI-Subnet1A') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('CFn-CI-VPC') }
  its(:cidr_block) { should eq '10.0.1.0/24' }
end

describe subnet('CFn-CI-Subnet1C') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('CFn-CI-VPC') }
  its(:cidr_block) { should eq '10.0.2.0/24' }
end

describe route_table('CFn-CI-PubRT') do
  it { should exist }
  it { should belong_to_vpc('CFn-CI-VPC') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_route('0.0.0.0/0').target(gateway: 'CFn-CI-IGW') }
  it { should have_subnet('CFn-CI-Subnet1C') }
  it { should have_subnet('CFn-CI-Subnet1A') }
end
