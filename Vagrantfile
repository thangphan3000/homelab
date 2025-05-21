MASTER_NODE_COUNT = 2
WORKER_NODE_COUNT = 2
LB_COUNT          = 2
CIDR              = '172.16.1'

def setup_dns(node)
  node.vm.provision "setup-hosts", :type => "shell", :path => "scripts/setup-hosts.sh" do |s|
    s.args = ["eth1"]
  end
end

Vagrant.configure("2") do |config|
  (1..MASTER_NODE_COUNT).each do |idx|
    config.vm.define "k8s-master-#{idx}" do |node|
      node.vm.box = 'xandradx/generic-ubuntu2204-vmware-aarch64'
      node.vm.network :private_network, ip: "#{CIDR}.#{20 + idx}"
      node.vm.hostname = "k8s-master-#{idx}"
      node.vm.provider :vmware_desktop do |vd|
        vd.memory = 2048
        vd.cpus   = 2
      end
    end
  end

  (1..WORKER_NODE_COUNT).each do |idx|
    config.vm.define "k8s-worker-#{idx}" do |node|
      node.vm.box = 'xandradx/generic-ubuntu2204-vmware-aarch64'
      node.vm.network :private_network, ip: "#{CIDR}.#{30 + idx}"
      node.vm.hostname = "k8s-worker-#{idx}"
      node.vm.provider :vmware_desktop do |vd|
        vd.memory = 2048
        vd.cpus   = 2
      end
    end
  end

  config.vm.define 'lb' do |node|
    node.vm.box = 'xandradx/generic-ubuntu2204-vmware-aarch64'
    node.vm.network :private_network, ip: "#{CIDR}.41"
    node.vm.hostname = 'lb'
    node.vm.provider :vmware_desktop do |vd|
      vd.memory = 1024
      vd.cpus   = 1
    end
  end


  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/vagrant/vagrant_ed25519.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys 
    SHELL
  end
end
