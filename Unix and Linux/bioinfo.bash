# basic shell scripting for bioinformatics
# note from *Bioinformatics Data Skills, chapter 12 *


#!/bin/bash
set -e            # terminating the script if any command exited with a nonzero exit status.
set -u            # aborting the script if a variable’s value is unset.
set -o pipefail   # behavior—any program that returns a nonzero exit status in the pipe will cause the entire pipe to return a nonzero status

sample="CNTRL01A"
mkdir "${sample}_aln/"

command-line arguments 
(which are assigned to the value $1, $2, $3, etc.).
The variable $0 stores the name of the script.

# if
if [commands]
then
  [if-statements]
elif []
then
  []
else
  [else-statements]
fi


# for 
for i in [1..3]
do 
  echo 
done

break
continue

# function
myfunction(){

return $asdf
}

myfunction
result=$?
echo $result



# getopt 
Python’s argparse module
is much easier to use than getopt.

Some bioinformaticians make use of environmental variables to
store settings using the command export, but in general this
makes scripts less portable and reproducible. Instead, all important
settings should be stored inside the script as variables, rather than
as external environmental variables. This way, the script is selfcontained
and reproducible.


test "ATG" = "ATG" ; echo "$?"
test "ATG" = "atg" ; echo "$?"
test 3 -lt 1 ; echo "$?"

-z str String str is null (empty)
str1 = str2 Strings str1 and str2 are identical
str1 != str2 Strings str1 and str2 are different
int1 -eq int2 Integers int1 and int2 are equal
int1 -ne int2 Integers int1 and int2 are not equal
int1 -lt int2 Integer int1 is less than int2
int1 -gt int2 Integer int1 is greater than int2
int1 -le int2 Integer int1 is less than or equal to int2
int1 -ge int2 Integer int1 is greater than or equal to int2

test -d some_directory ; echo $? # is this a directory?
test -f some_file.txt ; echo $? # is this a file?
test -r some_file.txt ; echo $? $ is this file readable?
test -w some_file.txt ; echo $? $ is this file writable?

-d dir dir is a directory
-f file file is a file
-e file file exists
-h link link is a link
-r file file is readable
-w file file is writable
-x file file is executable (or accessible if argument is expression)

# array 
array={1 2 3 4 5}
value=$[array[3]]

length=${#array[*]}


# read table 
zmaysB R1 seq/zmaysB_R1.fastq
zmaysB R2 seq/zmaysB_R2.fastq
zmaysC R1 seq/zmaysC_R1.fastq
zmaysC R2 seq/zmaysC_R2.fastq

sample_files=($(cut -f 3 samples.txt))
echo ${sample_files[@]}

inspect the value of Internal Field Separator (IFS).
printf %q "$IFS"  # space. tab line break

# basename
basename seqs/zmaysA_R1.fastq   # zmaysA_R1.fastq
basename seqs/zmaysA_R1.fastq .fastq
zmaysA_R1
basename -s .fastq seqs/zmaysA_R1.fastq
zmaysA_R1


# find 
-type f # find file only

find zmays-snps -maxdepth -name "zmaysB*fastq" -type f
find data/seqs -name "zmaysA*fastq" -or -name "zmaysC*fastq" -type f
find . -name "*-temp.fastq" -exec rm -i {} \;



-name <pattern> Match a filename to <pattern>, using the same special characters
(*, ?, and [...] as Bash)
-iname <pat
tern>
Identical to -name, but is case insensitive
-empty Matches empty files or directories
-type <x> Matches types x (f for files, d for directories, l for links)
-size <size> Matches files where the <size> is the file size (shortcuts for kilobytes
(k), megabytes (M), gigabytes (G), and terabytes (T) can be used); sizes
preceded with + (e.g., +50M) match files at least this size; sizes preceded
with - (e.g., -50M) match files at most this size
-regex Match by regular expression (extended regular expressions can be
enabled with -E)
-iregex Identical to -regex, but is case insensitive
-print0 Separate results with null byte, not newline
expr -and expr Logical “and”
expr -or expr Logical “or”
-not / "!"expr Negation
(expr) Group a set of expressions

touch zmays{A,C}_R{1,2}-temp.fastq


# xargs works by taking input from standard in and splitting it by spaces, tabs, and
# newlines into arguments.
find . -name "*-temp.fastq" | xargs rm
find . -name "samples [AB].txt" -print0 | xargs -0 rm

find . -name "*.fastq" | xargs basename -s ".fastq" | \
xargs -P 6 -I{} fastq_stat --in {}.fastq --out ../summaries/{}.txt

#
Create Bash script containing the commands
to process a single sample, and have xargs run this script in
many parallel Bash processes. For example:

#!/bin/bash
set -e
set -u
set -o pipefail
sample_name=$(basename -s ".fastq" "$1")
some_program ${sample_name}.fastq | another_program >
${sample_name}-results.txt

find . -name "*.fastq" | xargs -n 1 -P 4 bash script.sh
-n 1 forces xargs to process one input argument at a time
how many processes
to run with -P.

# GNU parallel 
find . -name "*.fastq" | parallel --max-procs=6 'program {/.} > {/.}-out.txt'



### Make
very powerful tool used to create bioinformatics pipelines.
makefiles are constructed as a set of rules,
each rule has three parts: the target, the prerequisites, and the recipe.

only generates targets when they don’t
exist or when their prerequisites have been modified.




## BGZF and Tabix
Blocked GNU Zip Format
while gzip compresses the entire file, BGZF files are compressed in blocks.
bgzip and tabix programs installed.
These are both included with Samtools,

# 1 create BGZF file
zgrep "^#" Mus_musculus.GRCm38.75.gtf.gz; \
zgrep -v "^#" Mus_musculus.GRCm38.75.gtf.gz | \
sort -k1,1 -k4,4n) | bgzip > Mus_musculus.GRCm38.75.gtf.bgz

# 2 tabix the bgz file
tabix -p gff Mus_musculus.GRCm38.75.gtf.bgz

# 3 query the data 
tabix Mus_musculus.GRCm38.75.gtf.bgz 16:23146536-23158028 | head -n3


# SQLite
occasionally we do need to store and manipulate data that is best represented
in many related tables


sqlite3 gwascat.db
.tables  #list tables in the database
.schema  # (the SQL statement used to create a table)
			# provides a list of all columns and their preferred type.

SELECT * FROM gwascat;
sqlite3 gwascat.db "SELECT * FROM gwascat" > results.txt
SELECT * FROM gwascat LIMIT 2;
SELECT trait, chrom, position, strongest_risk_snp, pvalue
FROM gwascat ORDER BY author LIMIT 5;

sqlite> SELECT chrom, position, strongest_risk_snp, pvalue
...> FROM gwascat WHERE chrom = "22"
...> AND position BETWEEN 24000000 AND 25000000
...> AND pvalue IS NOT NULL ORDER BY pvalue LIMIT 5;



#### Genomic Ranges
bedtool
GenomicRanges in R 


# coordinate system convert
• CrossMap is a command-line tool that converts many data formats (BED, GFF/
GTF, SAM/BAM, Wiggle, VCF) between coordinate systems of different assembly
versions.
• NCBI Genome Remapping Service is a web-based tool supporting a variety of
genomes and formats.
• LiftOver is also a web-based tool for converting between genomes hosted on the
UCSC Genome Browser’s site.

• 0-based coordinate system, with half-closed, half-open intervals.
• 1-based coordinate system, with closed intervals.


Format/library Type
BED 0-based
GTF 1-based
GFF 1-based
SAM 1-based
BAM 0-based
VCF 1-based
BCF 0-based
Wiggle 1-based
GenomicRanges 1-based
BLAST 1-based
GenBank/EMBL Feature Table 1-based


Bioconductor is an open source software project
that creates R bioinformatics packages

biocLite() installs the correct version of a package for your R version (and its corresponding
Bioconductor version).

GenomicRanges package, which extends IRanges by handling biological
details like chromosome name and strand

















