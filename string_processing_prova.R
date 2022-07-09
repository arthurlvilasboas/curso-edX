library(gutenbergr)
library(tidytext)
library(tidyverse)
library(dslabs)
library(textdata)

gutenberg_metadata

sum(str_detect(gutenberg_metadata$title, "Pride and Prejudice"),na.rm=TRUE)

gutenberg_metadata %>%
  filter(str_detect(title, "Pride and Prejudice"))

id <- gutenberg_works(gutenberg_metadata$title == "Pride and Prejudice")$gutenberg_id
id

book <- gutenberg_download(id)
words <- book %>% unnest_tokens(word, text)
nrow(words)

words$gutenberg_id <- NULL
stop_words$lexicon <- NULL

words <- words %>% anti_join(stop_words)
nrow(words)

words <- words %>% filter(!str_detect(word, "\\d"))
nrow(words)

words %>% count(word) %>% filter(n > 100) %>% nrow()

words %>% count(word) %>% top_n(1, n) %>% pull(word)

words %>% count(word) %>% top_n(1, n) %>% pull(n)

afinn <- get_sentiments("afinn")

afinn_sentiments <- inner_join(words,afinn)
nrow(afinn_sentiments)
mean(afinn_sentiments$value > 0,na.rm = TRUE)
sum(afinn_sentiments$value == 4)
