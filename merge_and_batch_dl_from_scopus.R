options("elsevier_api_key" = "") #Personal, so it is redacted
scopus1 <- read.csv(file = "", stringsAsFactors = F) #file available on request
scopus2 <- read.csv(file = "", stringsAsFactors = F) #file available on request
dataset.gen <- rbind(scopus1, scopus2)
sum(dataset.gen$DOI == "")
# [1] 2663
dataset <- dataset.gen[which(dataset.gen$DOI != ""), ]
dois <- dataset$DOI
retr <- lapply(dois, rscopus::article_retrieval,
               view = "META_ABS", identifier = c("doi"), verbose = TRUE)

#4031, 18546 are empty
retr <- retr[-c(4031, 18546)]

##FROM ELSEVIER SUPPORT
# DOI provided is not available in ScienceDirect (it is a Taylor and Francis publication).
# The Article Retrieval API (/content/article/doi) pulls articles from the ScienceDirect corpus.
# Only articles available on ScienceDirect are available through that API.
save("../inputs/batch_scopus.Rdata")
