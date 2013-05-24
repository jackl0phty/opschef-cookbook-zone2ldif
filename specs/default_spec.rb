require 'chefspec'

describe 'zone2ldif::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge('zone2ldif::default') } 
    it 'Checks if /usr/local/bin/zone2ldif.pl exists.' do
      expect(chef_run).to create_remote_file '/usr/local/bin/zone2ldif.pl' 
      file = chef_run.remote_file('/usr/local/bin/zone2ldif.pl')
      expect(file).to be_owned_by('root', 'root')
      expect(file.mode).to eq("0744") 
    end
    it 'Should include the Perl::default recipe.' do
      chef_run.should include_recipe 'perl::default'
    end
end
