Before execute this commands (on workers and masters) register kubernetes.repo on system and edit daemon.json file (if docker has already installed)

Files to execute in order on master node:
1_installk8s
2_setEVk8s
3_createnetK8s
4_removeNodes

File to execute on worker node (edit kubectl join command firstly)
installworkersk8s


1_installk8s , 2_setEVk8s & installworkersk8s files require sudo command to get executed correctly. In 2_setEVk8s, kubectl command does not require sudo but for others it is neccesary.