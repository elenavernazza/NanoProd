####################################################################################################
####################################################################################################

# Use Lxplus8
ssh evernazz@lxplus8.cern.ch
work 
cd ULv12_Production/NanoProd

####################################################################################################
cd ULv12_Production/
# git clone --recursive https://github.com/cms-tau-pog/NanoProd.git -b HTT_skim_v1
git clone --recursive https://github.com/cms-tau-pog/NanoProd.git
git checkout HTT_skim_v1
cd NanoProd
git submodule update
####################################################################################################

####################################################################################################
gfal-mkdir root://eos.grif.fr///eos/grif/cms/llr/store/user/evernazz/HTT
gfal-mkdir root://eos.grif.fr///eos/grif/cms/llr/store/user/evernazz/HTT/Run2_2016
gfal-mkdir root://eos.grif.fr///eos/grif/cms/llr/store/user/evernazz/HTT/Run2_2016_HIPM
gfal-mkdir root://eos.grif.fr///eos/grif/cms/llr/store/user/evernazz/HTT/Run2_2017
gfal-mkdir root://eos.grif.fr///eos/grif/cms/llr/store/user/evernazz/HTT/Run2_2018
####################################################################################################

####################################################################################################
source $PWD/env.sh
voms-proxy-init -voms cms -rfc -valid 192:00
python RunKit/checkTasksConsistency.py NanoProd/crab/Run2_2016/ZZbbtt.yaml
python RunKit/checkDatasetExistance.py NanoProd/crab/Run2_2016/ZZbbtt.yaml
rm -r crab_test
rm -r .crabOverseer
####################################################################################################

# ZZ 2016
screen
source $PWD/env.sh
voms-proxy-init -voms cms -rfc -valid 192:00
python RunKit/crabOverseer.py --work-area crab_test --cfg NanoProd/crab/overseer_cfg.yaml NanoProd/crab/Run2_2016/ZZbbtt.yaml NanoProd/crab/Run2_2016/ZbbHtt.yaml NanoProd/crab/Run2_2016/ZttHbb.yaml

# ZZ 2016_HIPM
screen
source $PWD/env.sh
voms-proxy-init -voms cms -rfc -valid 192:00
python RunKit/crabOverseer.py --work-area crab_test_2016_HIPM --cfg NanoProd/crab/overseer_cfg_2016_HIPM.yaml NanoProd/crab/Run2_2016_HIPM/ZZbbtt.yaml NanoProd/crab/Run2_2016_HIPM/ZbbHtt.yaml NanoProd/crab/Run2_2016_HIPM/ZttHbb.yaml

# ZZ 2017
screen
source $PWD/env.sh
voms-proxy-init -voms cms -rfc -valid 192:00
python RunKit/crabOverseer.py --work-area crab_test_2017 --cfg NanoProd/crab/overseer_cfg_2017.yaml NanoProd/crab/Run2_2017/ZZbbtt.yaml NanoProd/crab/Run2_2017/ZbbHtt.yaml NanoProd/crab/Run2_2017/ZttHbb.yaml

# ZZ 2018
screen
source $PWD/env.sh
voms-proxy-init -voms cms -rfc -valid 192:00
python RunKit/crabOverseer.py --work-area crab_test_2018 --cfg NanoProd/crab/overseer_cfg_2018.yaml NanoProd/crab/Run2_2018/ZZbbtt.yaml NanoProd/crab/Run2_2018/ZbbHtt.yaml NanoProd/crab/Run2_2018/ZttHbb.yaml

####################################################################################################

####################################################################################################

####################################################################################################
screen -r
screen -ls
Ctr+A Esc to scroll
####################################################################################################