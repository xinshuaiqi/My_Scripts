

#change wdr
import os
os.chdir("D:\\bio.software\\gutenkunstlab-dadi-a17e7d134abf\\gutenkunstlab-dadi-a17e7d134abf\\examples\\fs_from_data")

#star dadi
import dadi

##read inputfile
dd = Misc.make_data_dict (data.txt)
fs = Spectrum.from_data_dict (dd , pop_ids =[ 'YRI ', 'CEU '],
                                projections =[10 , 12] ,
                                polarized = True)
