source("http://bioconductor.org/biocLite.R")
?BiocUpgrade
biocLite("biomaRt")

library("biomaRt")



#select a mart to use and show the list of fungi
ensembl_fungi <- useMart(host ="https://fungi.ensembl.org", biomart="fungi_mart", port = 443)
head(listDatasets(ensembl_fungi))

#utilizing all data sets
fungi = useDataset(dataset =c("aclavatus_eg_gene") ,mart = ensembl_fungi)
fungi2 = useDataset(dataset =c("aflavus_eg_gene") ,mart = ensembl_fungi)
fungi3 = useDataset(dataset =c("afumigatus_eg_gene") ,mart = ensembl_fungi)
fungi4 = useDataset(dataset =c("afumigatusa1163_eg_gene") ,mart = ensembl_fungi)
fungi5 = useDataset(dataset =c("agossypii_eg_gene") ,mart = ensembl_fungi)
fungi6 = useDataset(dataset =c("anidulans_eg_gene") ,mart = ensembl_fungi)
listMarts(ensembl_fungi)

listAttributes(fungi)



#creating results related to GOID :proteins targeting to vacuole
result1 = getBM(attributes = c("ensembl_gene_id","name_1006","definition_1006") ,filters = "go", values = "GO:0006623" ,mart = fungi)
result2 =getBM(attributes = c("ensembl_gene_id" ,"name_1006" ,"definition_1006") ,filters = "go", values = "GO:0006623" ,mart = fungi2)
result3 =getBM(attributes = c("ensembl_gene_id" ,"name_1006" ,"definition_1006") ,filters = "go", values = "GO:0006623" ,mart = fungi3)
result4 =getBM(attributes = c("ensembl_gene_id" ,"name_1006" ,"definition_1006") ,filters = "go", values = "GO:0006623" ,mart = fungi4)
result5 =getBM(attributes = c("ensembl_gene_id" ,"name_1006" ,"definition_1006") ,filters = "go", values = "GO:0006623" ,mart = fungi5)
result6 =getBM(attributes = c("ensembl_gene_id" ,"name_1006" ,"definition_1006"),filters = "go", values = "GO:0006623" ,mart = fungi6)

#merging data and writing to file
final_result =rbind(result1 , result2 , result3 , result4 , result5 , result6, by=c("ensembl_gene_id", "name_1006", "definition_1006"))

write.table(final_result, "C:\\Users\\angel\\Desktop\\GOresult.txt", sep = "\t")
