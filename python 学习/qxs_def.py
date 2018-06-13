def break_word(AA):
	words=AA.split(' ')
	return words
	
def sort_words(words):
	return sorted(words)

	
	
	
# how to use 
import qxs_def
words=qxs_def.break_word("Xinshuai Qi")

qxs_def.sort_words(words)

words.append("shanshan")
for i in range(2):
    #print(i)
    print(words[i])
