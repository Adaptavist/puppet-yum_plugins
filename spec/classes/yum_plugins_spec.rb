require 'spec_helper'
 
describe 'yum_plugins', :type => 'class' do
    
  context "Should include yum::plugin fastestmirror" do
  
    it do
      should contain_yum__plugin('fastestmirror').with_source('puppet:///modules/yum_plugins/fastestmirror.conf')
    end
  end
end
