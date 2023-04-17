args=commandArgs(TRUE)

if(length(args)!=2){stop("Rscript .R")}

suppressWarnings(suppressMessages({
  library(data.table)
  library(dplyr)
}))

pvar_file = args[1]
out_file = args[2]


pvar <- fread(pvar_file)

chr_num <- strsplit(pvar$ID[1], "_")[[1]][1]
num_snps <- nrow(pvar)


out <- as.data.frame(matrix(0, nrow = num_snps, ncol = 2))
out$V1 <- pvar$POS
out$V2 <- paste0(chr_num, as.character(seq(1, num_snps)))


fwrite(out, out_file,row.names=F,quote=F,sep="\t", col.names = F)
