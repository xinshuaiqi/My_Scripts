#####################
#run sate on ratel
#####################

cd sate
 cp -r satesrc-sample/ sate-brassica4-test
cd sate-brassica4-test/sate-core
mkdir data

###################
# on your local PC
###################
change input file format:
"replace_seqnames.pl"


# upload your ORG.txt from "out"folder to data/
# put your seq.list in the home folder of this sate
scp Final/out/* qixinshuai@ratel.arl.arizona.edu:/home/qixinshuai/sate/sate-brassica4-test/sate-core/data
scp seq.list qixinshuai@ratel.arl.arizona.edu:/home/qixinshuai/sate/sate-brassica4-test/sate-core

#####################
#back to ratel
#####################
			# 有必要么？
			for file in *; do sed -i 's/\s/\n/g' $file; done
			sed 's/\s/\n/g' seq.list>seq.list
perl ratel_cpu_loader.pl seq.list 5
