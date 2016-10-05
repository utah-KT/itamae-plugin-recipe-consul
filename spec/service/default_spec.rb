describe file("/etc/consul.d") do
  it { should exist }
  it { should be_directory }
end

describe service("consul") do
  context "when service_actions contains enable", if: node[:consul][:service_actions].include?("enable") do
    it { should be_enabled }
  end

  context "when service_actions contains disable", if: node[:consul][:service_actions].include?("disable") do
    it { should_not be_enabled }
  end

  context "when service_actions contains start", if: node[:consul][:service_actions].include?("start") do
    it { should be_running }
  end

  context "when service_actions contains stop", if: node[:consul][:service_actions].include?("stop") do
    it { should_not be_running }
  end
end
