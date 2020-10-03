control 'Ensure ports other than 22(SSH), 53(local bind), and 80(http) are not listening' do
    title 'Ensure ports other than 22(SSH), 53(local bind), and 80(http) are not listening'

    describe port.where { protocol =~ /tcp/ && port > 0 && port < 22 } do
        it { should_not be_listening }
    end

    describe port.where { protocol =~ /tcp/ && port > 22 && port < 53 } do
        it { should_not be_listening }
    end

    describe port.where { protocol =~ /tcp/ && port > 53 && port < 80 } do
        it { should_not be_listening }

    end

    describe port.where { protocol =~ /tcp/ && port > 80 } do
        it { should_not be_listening }
    end
end

control 'Ensure ssh and apache2 are enabled and running.' do
	title 'Ensure ssh and apache2 are enabled and running.'

    packages = ['ssh', 'apache2']
    packages.each do |package|
        describe systemd_service(package) do
            it { should be_enabled }
            it { should be_running }
        end
    end
end

control 'Ensure apache2 security.conf file exists and config for hiding its version banner has been applied.' do
	title 'Ensure apache2 security.conf file exists and config for hiding its version banner has been applied.'

    describe file('/etc/apache2/conf-enabled/security.conf') do
        it { should exist }
        its(:content) { should match(/^ServerTokens Prod/) }
        its(:content) { should match(/^ServerSignature Off/) }
    end
end
