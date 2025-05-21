# File Structure

```bash
├── Vagrantfile       # Definitions of the virtual machines
├── group_vars        # Global variables
├── inventory         # Hosts declarations
├── playbook.yml      # Main deployment file
├── roles             # Interdependent roles
├── roles             # Interdependent roles
│   ├── cni           # Network plugin Calico, Flannel and Cilium configuration
│   ├── common        # Installation of required packages for Kubernetes cluster
│   ├── container     # Container runtime installation (containerd)
│   ├── loadbalancer  # Load balancer based on Nginx
```
