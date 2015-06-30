require 'spec_helper'
describe 'bashprofile', :type => :define do
  before(:each) do
    # We can mock hiera the same way we mock any other function
    MockFunction.new('pwsafe_lookup') { |f|
      # Sets up some mock data in hiera
      f.stubs(:call).with(anything()).returns('password')
    }
  end
  context 'dev tier with defaults' do
    let :facts do
    {
      :tier                      => 'dev',
      :kernel                    => 'Linux',
      :osfamily                  => 'RedHat',
      :operatingsystem           => 'CentOS',
      :operatingsystemrelease    => '6',
      :operatingsystemmajrelease => '6',
      :concat_basedir            => '/tmp'
    }
    end
    it {
      should contain_file('/etc/profile.d/PS1.sh').with(
        'ensure'   => 'present')
    }
  end

  context 'staging tier with defaults' do
    let :facts do
    {
      :tier                      => 'staging',
      :kernel                    => 'Linux',
      :osfamily                  => 'RedHat',
      :operatingsystem           => 'CentOS',
      :operatingsystemrelease    => '6',
      :operatingsystemmajrelease => '6',
      :concat_basedir            => '/tmp'
    }
    end
    it {
      should contain_file('/etc/profile.d/PS1.sh').with(
        'ensure'   => 'present',)
    }

  end

  context 'prod tier with defaults' do
    let :facts do
    {
      :tier                      => 'prod',
      :kernel                    => 'Linux',
      :osfamily                  => 'RedHat',
      :operatingsystem           => 'CentOS',
      :operatingsystemrelease    => '6',
      :operatingsystemmajrelease => '6',
      :concat_basedir            => '/tmp'
    }
    end
    it {
      should contain_file('/etc/profile.d/PS1.sh').with(
        'ensure'   => 'present')
    }
  end

  context 'prod tier with ensure => absent' do
    let :facts do
    {
      :tier                      => 'prod',
      :kernel                    => 'Linux',
      :osfamily                  => 'RedHat',
      :operatingsystem           => 'CentOS',
      :operatingsystemrelease    => '6',
      :operatingsystemmajrelease => '6',
      :concat_basedir            => '/tmp'
    }
    end
    let :params do
    {
      :ensure => 'absent'
    }
    end
    it {
      should contain_file('/etc/profile.d/PS1.sh').with(
        'ensure'   => 'absent')
    }
  end

end

