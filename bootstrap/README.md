deploy OVF of vCenter server VCSA
wget https://raw.github.com/eperdeme/dell-eval/master/bootstrap/stage1.sh && bash stage1.sh
wget https://raw.github.com/eperdeme/dell-eval/master/bootstrap/puppet01.pp && puppet apply puppet01.pp
