"""
By Xinshuai Qi
This script will calculate Pi for each gene using vcftools
To run, you need to have a vcf file and a bed file with gene position information

Then just run the script
"""
import re
import os

print ("Make sure you can run vcftools FIRST!")
vcf = raw_input ("Enter the vcf file name: ")
#vcf = "126bra.recode.vcf"

bed = raw_input ("Enter the bed file name:")
#bed = "test3.bed"

genePi = "genePi"
#print vcf
#print bed

os.system("rm genePi.out")
#read gene position info for each gene
with open(bed) as f:
    for line in f:
        pos=re.split(r'\t',line)
	print (pos[0],pos[3])

	# now pos[0] = chr; pos[1]= from pos[2]=to pos[3]=gene name

	#run vcftools, extract the vcf file for each gene
	#cmd=("vcftools --vcf %s --chr %s --from-bp %s --to-bp %s --out %s --recode --keep-INFO-all" % (vcf,pos[0],pos[1],pos[2],genePi))
        recode = " --recode --keep-INFO-all --out genePi"
        cmd=("vcftools {4} --vcf {0} --chr {1} --from-bp {2} --to-bp {3}"\
	.format(vcf,pos[0],pos[1],pos[2],recode))
        print cmd
	os.system(cmd)

        len = int(pos[2])-int(pos[1])
	#print len
        gvcf = "genePi.recode.vcf"  # gene vcf file
        
	os.system("rm gene.re.pos.vcf")
#	open("gvcf.recode.vcf", 'w').close() # clean the gvcf.recode.vcf from the previous loop
        with open(gvcf) as ff:
            for gline in ff:
                gpos=re.split(r'\t',gline)
	  	if (gpos[0]==pos[0]):
			#print (int(gpos[1]))
			SNP = (int(gpos[1])-int(pos[1])+1)  # use SNP postion - gene start position
			#print (gpos[0],SNP)
			SNPrawPos=gpos[1]
			gpos[1]=SNP
			rawpos='\t'.join([pos[0],str(SNPrawPos)])
			newpos='\t'.join([gpos[0],str(SNP)])			
			#print (rawpos)
			#print (newpos)
			gline=gline.replace(rawpos,newpos)
	        #print (gline)	
		with open('gene.re.pos.vcf','a') as repos:
			repos.write(gline)


	#now calculate pi for gene.re.pos.vcf
	cmd = ("vcftools --vcf gene.re.pos.vcf --window-pi {0} --window-pi-step {0} --out gene.re.pos.pi").format(len)
	print cmd
	try:
		os.system(cmd)

		with open('gene.re.pos.pi.windowed.pi','r') as pi:
			lines = pi.readlines()
			lines[1]=lines[1].rstrip()
			lines = str('\t'.join([lines[1],pos[3]]))
			print (lines)
			with open("genePi.out",'a') as out:
				out.write(lines)
	except:
		pass

#rename the output file
newname=str('_'.join([bed,"genePi.out"]))
cmd=("mv genePi.out {0}").format(newname)
os.system(cmd)
