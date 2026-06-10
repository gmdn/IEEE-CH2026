library(dplyr)

tokens <- token_annotations |>
  arrange(page_id, sentence_id, token_id)

candidate_bigrams <- tokens |>
  group_by(page_id, sentence_id) |>
  mutate(
    token_2 = lead(token),
    upos_2 = lead(upos)
  ) |>
  ungroup() |>
  filter(
    (upos == "NOUN"  & upos_2 == "NOUN") |
      (upos == "ADJ"   & upos_2 == "NOUN") |
      (upos == "PROPN" & upos_2 == "PROPN")
  ) |>
  transmute(
    page_id,
    sentence_id,
    pattern = paste(upos, upos_2),
    candidate = paste(token, token_2)
  )

candidate_trigrams <- tokens |>
  group_by(page_id, sentence_id) |>
  mutate(
    token_2 = lead(token, 1),
    token_3 = lead(token, 2),
    
    upos_2 = lead(upos, 1),
    upos_3 = lead(upos, 2)
  ) |>
  ungroup() |>
  filter(
    (upos == "NOUN"  &
       upos_2 == "ADP" &
       upos_3 == "NOUN") |
      
      (upos == "PROPN" &
         upos_2 == "ADP" &
         upos_3 == "PROPN")
  ) |>
  transmute(
    page_id,
    sentence_id,
    pattern = paste(upos, upos_2, upos_3),
    candidate = paste(token, token_2, token_3)
  )


library(dplyr)
library(stringr)

propn_spans <- token_annotations |>
  arrange(page_id, sentence_id, token_id) |>
  mutate(
    is_propn = upos == "PROPN"
  ) |>
  group_by(page_id, sentence_id) |>
  mutate(
    group_id = cumsum(
      is_propn != lag(is_propn, default = first(is_propn))
    )
  ) |>
  ungroup() |>
  filter(is_propn) |>
  group_by(page_id, sentence_id, group_id) |>
  summarise(
    candidate = str_c(token, collapse = " "),
    n_tokens = n(),
    .groups = "drop"
  ) |>
  filter(n_tokens > 1 & n_tokens < 4)

propn_spans

candidate_terms <- bind_rows(
  candidate_bigrams,
  candidate_trigrams,
  propn_spans
)

candidate_frequency <- term_candidates |>
  count(candidate, pattern, sort = TRUE)

