library(dplyr)
library(purrr)
library(udpipe)

source("helpers.R")

#m_ita   <- udpipe::udpipe_download_model(language = "italian-isdt")
m_ita <- udpipe_load_model(
  "italian-isdt-ud-2.5-191206.udpipe"
)


annotations <- candidate_sentences |>
  mutate(
    annotation = map(
      sentence,
      ~ annotate_sentence(.x) |>
        select(
          -sentence_id,
          -sentence
        )
    )
  )


token_annotations <- annotations |>
  tidyr::unnest(annotation)


token_annotations |>
  summarise(
    n_tokens = n(),
    n_lemmas = n_distinct(lemma),
    n_sentences = n_distinct(page_id, sentence_id),
    n_pages = n_distinct(page_id)
  )


saveRDS(
  token_annotations,
  "data/token_annotations.rds"
)
