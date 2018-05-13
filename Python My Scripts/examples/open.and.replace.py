## open a file, replace things, then save as a new file

replacements = {"a.*":'arabidopsis thaliana'}


with open ('name.txt') as infile, open ('newname.txt','w') as outfile:
            for line in infile:
                        for src, target in replacements.iteritems():
                                    line = line.replace(src,target)
                        outfile.write(line)
