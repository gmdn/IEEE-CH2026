library(httr2)
library(jsonlite)
library(purrr)
library(dplyr)

source("helpers.R")

url <- paste0(
  "https://it.wikipedia.org/w/api.php?",
  "action=query&list=categorymembers",
  "&cmtitle=Categoria:Resistenza_italiana",
  "&cmlimit=500",
  "&format=json"
)

json <- fromJSON(url)

str(json$query$categorymembers)

pages_list <- json$query$categorymembers |>
  dplyr::select(
    page_id = pageid,
    ns,
    title
  ) |>
  filter(ns == 0) ## remove categories

pages_list |>
  count(ns)

##### NUMBER OF PAGES
n_pages <- nrow(pages_list)
print(n_pages)


### create pages dataframte
pages <- pages_list |>
  mutate(
    text = map_chr(title, safe_get_page_text),
    retrieved = !is.na(text)
  )

saveRDS(pages, "data/pages_raw.rds")
