library(bio3d)
library(dplyr)
?bio3d

aln <- read.fasta("muscle-I20201208-174533-0845-96144469-p1m.fst")

ide.mat <- seqidentity(aln)

plot.dmat(ide.mat, color.palette=bwr.colors,
          main="Sequence Identity", xlab="Structure No.",
          ylab="Structure No.")


png(filename="figure.png", height=800, width=800, bg="white")
par(mar=c(30,5,5,30)+.1)
heatmap(ide.mat, margins=c(12,12))
dev.off()


singleseq <- read.fasta("octo.fst")
#singleseq <- get.seq("XP_008966264.2")


?blast.pdb

blast <- blast.pdb(singleseq)



blastplot <- plot.blast(blast)
#remove suffix "_A" from PDB IDs
IDs <- gsub("_A","",blastplot$pdb.id)
#find top 3 hits
tophits <- as.vector(blastplot$pdb.id[1:3])
class(tophits)
?pdb.annotate


ann <- pdb.annotate(tophits)
