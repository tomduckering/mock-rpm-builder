execute "setup epel" do
  command "yum install -y http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm"
  not_if 'rpm -q epel-release-6-8'
end

package 'mock'

cookbook_file '/etc/mock/centos-6-x86_64-slc.cfg' do
  source 'centos-6-x86_64-slc.cfg'
end

file '/etc/profile.d/mock.sh' do
  content 'alias mock="mock --uniqueext=$USER"'
  owner "root"
  group 'root'
  mode 0755
end


group "packagebuilder"

user 'packagebuilder' do
  gid 'packagebuilder'
end

group 'mock' do
  members ['packagebuilder','vagrant']
end


%w(rpm-build rpmdevtools make).each do |pkg|
  package pkg
end