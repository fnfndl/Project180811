## tm은 영문에 유리 
## Sejong Dic. 한글에 유리
## 두 패키지를 써서 데이터클리닝 후 wordcloud 쓰면 좋음

list.files()
if(!requireNamespace("tm")){install.packages("tm")}
if(!requireNamespace("wordcloud")){install.packages("wordcloud")}

update.packages(checkBuilt = T,ask=F)
library(tm)
library(wordcloud)
library(RColorBrewer)


target <- readLines("https://www.dropbox.com/s/28n2omtacbbp2aw/%EC%84%9C%EC%9A%B8_%EC%8B%A0%EB%9D%BC%ED%98%B8%ED%85%94%EB%A6%AC%EB%B7%B0.txt?dl=1")
##url 마지막을 =0에서 =1로 고침

target <- VCorpus(VectorSource(target))#tm에만 맞춰진 클래스로 변경

target <- tm_map(target,stripWhitespace) #빈공간 삭제
#target <- tm_map(target,tolower)
#한글이기 때문에 에러남
target <- tm_map(target,removePunctuation) #
target <- tm_map(target,PlainTextDocument) #
target <- tm_map(target,removeNumbers) #

# 제외할 단어 더미 생성
mystopword <- c(stopwords('english'),
                "수 있는","같습니다","싶습니다",
                "서울에서","하고","은","이용했습니다",
                "곳이예요"
)
#제외하기
target <- tm_map(target,removeWords,mystopword) #

target <- TermDocumentMatrix(target) #

findAssocs(target,"신라호텔",0.5) #관계어 찾기_x,terms,corlimit
target <- as.matrix(target)
nrow(target) #열 수가 몇 개인지 확인
head(target)
target <- sort(rowSums(target),decreasing = T)
head(target,20)

pal <- brewer.pal(9,"Set3")
wordcloud(
  names(target),
  freq = target,
  scale = c(5,1),
  rot.per = 0.25,
  min.freq = 2,
  random.order = F,
  random.color = T,
  colors = pal
)

legend(
  0.3,
  1,
  "서울 신라호텔 이용후기 분석",
  cex = 0.8,
  fill = NA,
  border = NA,
  bg = 'white',
  text.col = "red",
  text.font = 2,
  box.col = "red"
)











                        