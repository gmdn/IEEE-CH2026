library(stringr)
library(dplyr)
library(tidyr)
library(tokenizers)
library(purrr)

# just a test
pages |>
  summarise(
    pages = n(),
    total_characters = sum(nchar(text)),
    total_words = sum(str_count(text, "\\S+")),
    mean_words = mean(str_count(text, "\\S+")),
    median_words = median(str_count(text, "\\S+"))
  )


sentences <- pages |>
  mutate(
    sentence = map(text, ~ tokenize_sentences(.x)[[1]])
  ) |>
  select(page_id, title, sentence) |>
  unnest_longer(sentence) |>
  group_by(page_id) |>
  mutate(
    sentence_id = row_number()
  ) |>
  ungroup() |>
  relocate(sentence_id, .after = page_id)

nrow(sentences)


candidate_sentences <- sentences |>
  mutate(
    sentence_length = nchar(sentence)
  ) |>
  filter(
    sentence_length >= 400,
    sentence_length <= 600
  )

candidate_sentences |>
  summarise(
    n_sentences = n(),
    mean_chars = mean(sentence_length),
    median_chars = median(sentence_length),
    min_chars = min(sentence_length),
    max_chars = max(sentence_length)
  )


candidate_sentences |>
  count(title, sort = TRUE)


candidate_sentences |>
  summarise(
    pages_represented = n_distinct(page_id)
  )

n_distinct(candidate_sentences$page_id)
