# Genomics Range data

library(IRanges)

rng <- IRanges(start=4, end=13)
rng
IRanges(start=4, width=3)
IRanges(end=5, width=5)

x <- IRanges(start=c(4, 7, 2, 20), end=c(13, 7, 5, 23))
names(x) <- letters[1:4]
x

class(x) # IRanges

start(x)
names(x)
range(x) # the span of the ranges 
head(x)

x[2:3]# subset
x[start(x)<5] # 

# range operation 
# add or minus from both side
x <- IRanges(start=c(40, 80), end=c(67, 114))
x + 4L
x -10L


# restrict on one side 

y <- IRanges(start=c(4, 6, 10, 12), width=13)
restrict(y, 5, 10)

# creates ranges width positions upstream of the ranges passed to it.
flank(x, width=7)

flank(x, width=7, start=FALSE)


reduce(x) # all the covered region
gap(x)    # all the uncovered region

intersect(a, b)
setdff(a,b)
setdff(b,a)
union(b, a)

# Pairwise version
psetdiff(), pinter,
sect(), punion(), and pgap().

findOverlaps(qry, sbj)


distanceToNearest(qry, sbj)
distance(qry, sbj)


# Run length encoding
x <- as.integer(c(4, 4, 4, 3, 3, 2, 1, 1, 1, 1, 1, 0, 0, 0,
                  0, 0, 0, 0, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4))

xrle <- Rle(x)
xrle
as.vector(xrle) # ==x

summary(xrle)
runLength(xrle)
runValue(xrle)

library(GenomicRanges)

gr <- GRanges(seqname=c("chr1", "chr1", "chr2", "chr3"),
              ranges=IRanges(start=5:8, width=10),
              strand=c("+", "-", "-", "+"))
gr
ranges(gr)
seqnames(gr)
length(gr)
names(gr)<-letters[1:length(gr)]
gr






# sequence data
# fastQ


# count seq number
bioawk -cfastx 'END{print NR}' untreated1_chr4.fq

Lowercase bases are often used to indicate soft masked repeats or low complexity
sequences (by programs like RepeatMasker and Tandem Repeats Finder).

Repeats and low-complexity sequences may also be hard masked, where nucleotides
are replaced with N (or sometimes an X).


Name ASCII character range Offset Quality score type Quality score range
Sanger, Illumina (versions 1.8 onward) 33-126 33 PHRED 0-93
Solexa, early Illumina (before 1.3) 59-126 64 Solexa 5-62
Illumina (versions 1.3-1.7) 64-126 64 PHRED 0-62


# in python conver to 0 - 93
phred = [ord(b)-33 for b in qual]

P = 10-Q/10
Q = -10 log10P
[10**(-q/10) for q in phred]

When working with sequencing data, you should always
. Be aware of your sequencing technology's error distributions and limitations
(e.g., whether it's affected by GC content)
. Consider how this might impact your analyses



seqtk is a general-purpose sequence toolkit written by Heng Li that contains
a subcommand for trimming low-quality bases off the end of sequences

# code 
sickle se -f untreated1_chr4.fq -t sanger -o untreated1_chr4_sickle.fq
seqtk trimfq untreated1_chr4.fq > untreated1_chr4_trimfq.fq

library(qrqc)

readfq # by Heng Li


# index
samtools faidx Mus_musculus.GRCm38.75.dna.chromosome.8.fa
# extract a specific region 
samtools faidx Mus_musculus.GRCm38.75.dna.chromosome.8.fa 8:123407082-123410744


## SAM file head 
@SQ
  SN: seq names
  LN: seq length
@RG read group
  SM: sample information
  PL: sequencing platform:PacBio, Illumina
@PG mapping program
  VN: version
  CL: cmd used 
  
  
# view header
  samtools view -H celegans.bam

# Alignment section
Query seq names | Bitwise Flag | Ref seq name | Position | mapping quality | CIGAR | RNEXT/ PNEXT |
Template length | SEQ | Quality

# bitwise flag 
# true/false properties about an alignment
samtools flags 147
0x93 147 PAIRED,PROPER_PAIR,REVERSE,READ2

# CIGAR flag
# matches/mismatches, insertions, deletions, soft or hard clipped, and so on.

# Soft clipping is when only part of the query sequence is aligned to the reference
# hard-clipped regions are not present in the sequence stored in the SAM field SEQ.

# mapping quality
a mapping quality of 20 translates to a 10(20/-10) = 1%
chance the alignment is incorrect.




# sam to bam
samtools view -b celegans.sam > celegans_copy.bam
samtools view -h celegans.bam > celegans_copy.sam 


# Index
## sort
samtools sort celegans_unsorted.bam celegans_sorted
# more memory and more CPUs
samtools sort -m 4G -@ 2 celegans_unsorted.bam celegans_sorted 
## index
samtools index celegans_sorted.bam



# Extracting alignments from a region with samtools view
samtools view NA12891_CEU_sample.bam 1:215906469-215906652 | head -n 3
samtools view -b NA12891_CEU_sample.bam 1:215906469-215906652 > USH2A_sample_alns.bam
# from BEd extract regions
samtools view -L USH2A_exons.bed NA12891_CEU_sample.bam | head -n 3

# samtools view also has options for filtering alignments based on bitwise flags, mapping quality, read group.
samtools flags 
samtools flags unmap
samtools flags 69
samtools flags READ1,PROPER_PAIR

samtools view -f 4 NA12891_CEU_sample.bam | head -n 3
samtools view -f 66 NA12891_CEU_sample.bam | head -n 3
# -F
# not match  !=
samtools view -F 4 NA12891_CEU_sample.bam | head -n 3   

# check counts
samtools view -F 6 NA12891_CEU_sample.bam | wc -
samtools view -F 7 NA12891_CEU_sample.bam | wc -l
samtools view -F 6 -f 1 NA12891_CEU_sample.bam | wc -l









































