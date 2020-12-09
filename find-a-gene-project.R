library(bio3d)
library(dplyr)
?bio3d

aln <- read.fasta("muscle-I20201208-174533-0845-96144469-p1m.fst")

ide.mat <- seqidentity(aln)
?plot.dmat

plot.dmat(ide.mat, color.palette=bwr.colors,
          main="Sequence Identity", xlab="Structure No.",
          ylab="Structure No.")


png(filename="figure.png", height=800, width=800, bg="white")
par(mar=c(30,5,5,30)+.1)
heatmap(ide.mat, margins=c(12,12))
dev.off()
