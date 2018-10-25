awk -v seq="sequence2" -v RS='>' '$1 == seq {print RS $0}' file
