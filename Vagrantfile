MASTER_NODE_COUNT   = 2
WORKER_NODE_COUNT   = 2
LOAD_BALANCER_COUNT = 2

Vagrant.configure('2') do |config|
  (1..LOAD_BALANCER_COUNT).each do |idx|
    config.vm.define "k8s-lb-#{idx}" do |node|
      node.vm.box         = 'bento/ubuntu-24.04'
      node.vm.box_version = "202502.21.0"
      node.vm.hostname    = "k8s-lb-#{idx}"
      node.vm.network :private_network, ip: "172.16.0.1#{idx}"
      node.vm.provider :virtualbox do |vb|
        vb.name   = "k8s-lb-#{idx}"
        vb.memory = 1024
        vb.cpus   = 1
      end
    end
  end

  (1..MASTER_NODE_COUNT).each do |idx|
    config.vm.define "k8s-master-#{idx}" do |node|
      node.vm.box         = 'bento/ubuntu-24.04'
      node.vm.box_version = "202502.21.0"
      node.vm.hostname    = "k8s-master-#{idx}"
      node.vm.network :private_network, ip: "172.16.1.1#{idx}"
      node.vm.provider :virtualbox do |vb|
        vb.name   = "k8s-master-#{idx}"
        vb.memory = 2048
        vb.cpus   = 2
      end
    end
  end

  (1..WORKER_NODE_COUNT).each do |idx|
    config.vm.define "k8s-worker-#{idx}" do |node|
      node.vm.box         = 'bento/ubuntu-24.04'
      node.vm.box_version = "202502.21.0"
      node.vm.hostname    = "k8s-worker-#{idx}"
      node.vm.network :private_network, ip: "172.16.2.1#{idx}"
      node.vm.provider :virtualbox do |vb|
        vb.name   = "k8s-worker-#{idx}"
        vb.memory = 2048
        vb.cpus   = 2
      end
    end
  end

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/vagrant/vagrant_ed25519.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys 
    SHELL
  end
end
