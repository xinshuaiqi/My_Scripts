# -*- coding: utf-8 -*-
"""
Created on Wed May 18 22:06:28 2016

@author: qxs

learn biopython

"""
import numpy

from reportlab.graphics import renderPDF

# after download biopython.exe, run, then I need to set the paths to Bio
import sys
sys.path.append("D:\Program Files (x86)\Python3.51\Lib\site-packages")
import Bio 


# 序列处理
from Bio.Seq import Seq
dna = Seq("ATCGGTCA")

print(dna)
dna.complement() #互补序列

dna.reverse_complement()

## load a fasta seq and check basis info
from Bio import SeqIO
import os
os.chdir('D:\\Program Files (x86)\\Python3.51\\Lib\\site-packages\\Doc\\examples')
handle = open("ls_orchid.fasta")

for seq_record in SeqIO.parse(handle, "fasta") :
    print (seq_record.id)
    print (repr(seq_record.seq)) # repr used to change sth into string
    print (len(seq_record))
handle.close()

# load a gbk file
from Bio import SeqIO
handle = open("ls_orchid.gbk")
for seq_record in SeqIO.parse(handle, "genbank") :
    print (seq_record.id)
    print (repr(seq_record.seq))
    print (len(seq_record))
handle.close()


# count 
dna = Seq('GATCGATGGGCCTATATAGGATCGAAAATCGC')
len(dna)
dna[4:12]
dna[0::3]  # 从0 开始，每隔3个 取一次
# GC content
float(dna.count("G")+dna.count('C'))/len(dna)

# 直接计算GC
from Bio.SeqUtils import GC
GC(dna)


from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
my_seq = Seq("GATCG", IUPAC.unambiguous_dna)
for index, letter in enumerate(my_seq):
    print (index, letter)

#seq to string
str(dna)
dna

print(dna)
dna.tostring()


#DNA to RNA
coding_dna = Seq("ATGGCCATTGTAATGGGCCGCTGAAAGGGTGCCCGATAG", IUPAC.unambiguous_dna)
print(coding_dna)

mRNA=coding_dna.transcribe()
mRNA

pro=mRNA.translate()
pro

pro=mRNA.translate(to_stop=True) # stop when * happened
pro

from Bio.Data import CodonTable
standard_table = CodonTable.unambiguous_dna_by_id[1]
mito_table = CodonTable.unambiguous_dna_by_id[2]
print (standard_table)
print (mito_table)

mito_table.stop_codons
mito_table.start_codons
mito_table.forward_table["ACG"]

from Bio.SeqRecord import SeqRecord
help(SeqRecord)












'''
## draw a chromosome for Brassica rapa
'''


from reportlab.lib.units import cm
from Bio import SeqIO
from Bio.Graphics import BasicChromosome

entries = [("A01", 26791027),
           ("A02", 26939825),
           ("A03", 31765687),
           ("A04", 19269588),
           ("A05", 25303531),
           ("A06", 25210367),
           ("A07", 25876095),
           ("A08", 20826944),
           ("A09", 38884799),
           ("A10", 16405179)]

max_len = 38884799 #Could compute this
telomere_length = 1000000

chr_diagram = BasicChromosome.Organism()
chr_diagram.page_size = (29.7*cm, 21*cm) #A4 landscape

for name, length in entries:
    cur_chromosome = BasicChromosome.Chromosome(name)
    #Set the scale to the MAXIMUM length plus the two telomeres in bp,
    #want the same scale used on all five chromosomes so they can be
    #compared to each other
    cur_chromosome.scale_num = max_len + 2 * telomere_length

    #Add an opening telomere
    start = BasicChromosome.TelomereSegment()
    start.scale = telomere_length
    cur_chromosome.add(start)

    #Add a body - using bp as the scale length here.
    body = BasicChromosome.ChromosomeSegment()
    body.scale = length
    cur_chromosome.add(body)

    #Add a closing telomere
    end = BasicChromosome.TelomereSegment(inverted=True)
    end.scale = telomere_length
    cur_chromosome.add(end)

    #This chromosome is done
    chr_diagram.add(cur_chromosome)

os.chdir('C:\\Users\\qxs\\Documents\\Python Scripts')
chr_diagram.draw("Brapa_chrom.pdf", "Brassica rapa")


###### simcoal2 

from Bio.PopGen.SimCoal.Template import generate_simcoal_from_template

generate_simcoal_from_template('simple',
    [(1, [('SNP', [24, 0.0005, 0.0])])],
    [('sample_size', [30]),
    ('pop_size', [100])])

generate_simcoal_from_template('island',
    [(1, [('SNP', [24, 0.0005, 0.0])])],
    [('sample_size', [30]),
    ('pop_size', [100]),
    ('mig', [0.01]),
    ('total_demes', [10, 50, 100])])























