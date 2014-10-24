library(RCurl)
Q3dataURL2<-("https://raw.githubusercontent.com/jrwolf/IT497/master/fitstats.csv")

Q3data2<-getURL(Q3dataURL2)

Q3data2<-read.csv(textConnection(Q3data2), sep=",", header = TRUE)

Q3data2$Steps<-gsub(pattern = "RT @JennMamaBear: 4,997", 
                    replacement = "4997", x = Q3data2$Steps, 
                    ignore.case = TRUE, perl = FALSE, 
                    fixed = FALSE, useBytes = FALSE)

Q3data2$Steps<-as.numeric(as.character(Q3data2$Steps))

library(ggplot2)
figure2<-ggplot(Q3data2, aes(x=Steps, y=Miles)) + geom_point(shape=1)
