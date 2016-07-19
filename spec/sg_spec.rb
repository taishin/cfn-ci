require 'spec_helper'

describe security_group('CFn-CI-SG-Base') do
  it { should exist }
  its(:inbound) { should be_opened(22).protocol('tcp').for('0.0.0.0/0') }
  its(:outbound) { should be_opened }
  its(:inbound_rule_count) { should eq 1 }
  its(:outbound_rule_count) { should eq 1 }
  its(:inbound_permissions_count) { should eq 1 }
  its(:outbound_permissions_count) { should eq 1 }
  it { should belong_to_vpc('CFn-CI-VPC') }
end

describe security_group('CFn-CI-SG-HTTP') do
  it { should exist }
  its(:inbound) { should be_opened(80).protocol('tcp').for('0.0.0.0/0') }
  its(:outbound) { should be_opened }
  its(:inbound_rule_count) { should eq 1 }
  its(:outbound_rule_count) { should eq 1 }
  its(:inbound_permissions_count) { should eq 1 }
  its(:outbound_permissions_count) { should eq 1 }
  it { should belong_to_vpc('CFn-CI-VPC') }
end