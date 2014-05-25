corr <- function(directory, threshold = 0){
	directory<-("./specdata/")
	all_files <- as.character( list.files(directory) )
     file_paths <- paste(directory, all_files, sep="")
     complete_table<-complete("specdata", 1:332)
     nobs<-complete_table$nobs
     ids<-complete_table$id[nobs>threshold]
     id_len<-length(ids)
     corr_vector<-rep(0,id_len)
     j<-1
     for (i in ids){
     	current_files<-read.csv(file_paths[i],header=T, sep=",")
     	corr_vector[j]<-cor(current_files$sulfate, current_files$nitrate, use="complete.obs")
     	j<-j+1
     
     }
     result<-corr_vector
     return(result)
 }