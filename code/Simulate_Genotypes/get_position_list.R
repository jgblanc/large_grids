args=commandArgs(TRUE)

if(length(args)!=2){stop("Rscript .R")}

suppressWarnings(suppressMessages({
  library(data.table)
  library(dplyr)
}))

pvar_file = args[1]
out_file = args[2]


pvar <- fread(pvar_file)

chr_num <- as.numeric(strsplit(pvar$ID[1], "_")[[1]][1])
num_snps <- nrow(pvar)


out <- as.data.frame(matrix(0, nrow = num_snps, ncol = 2))
out$V1 <- pvar$ID
out$V2 <- as.character(seq(chr_num*2000, (chr_num*2000) + num_snps - 1))


fwrite(out, out_file,row.names=F,quote=F,sep="\t", col.names = F)
