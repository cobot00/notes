# Vagrant

## Box

```bash
vagrant box add [box_name] [url]

vagrant box list
```

```bash
vagrant box add ubuntu1604 https://atlas.hashicorp.com/bento/boxes/ubuntu-16.04/versions/2.3.6/providers/virtualbox.box
```

## VM

```bash
mkdir [vm_name]
cd [vm_name]
vagrant init [box_name]

vagrant up
vagrant ssh
vagrant reload

vagrant halt

vagrant destroy
```

## Trouble shooting
```
Vagrant was unable to mount VirtualBox shared folders.
```
```
/sbin/mount.vboxsf: mounting failed with the error: No such device
```

```bash
sudo yum -y update kernel
sudo yum -y install kernel-devel kernel-headers dkms gcc gcc-c++
```

```bash
sudo rm /sbin/mount.vboxsf
sudo ln -s /usr/lib/VBoxGuestAdditions/mount.vboxsf /sbin/mount.vboxsf

sudo mount -t vboxsf -o uid=500,gid=500 vagrant /vagrant
```

```bash
sudo /etc/init.d/vboxadd setup
```
