library(purrr)

get_page_text <- function(title) {
  
  Sys.sleep(runif(1, 0.5, 1.5))
  
  req <- request("https://it.wikipedia.org/w/api.php") |>
    req_url_query(
      action = "query",
      prop = "extracts",
      explaintext = 1,
      titles = title,
      format = "json"
    ) |>
    req_retry(
      max_tries = 5
    )
  
  res <- req |>
    req_perform() |>
    resp_body_json()
  
  page <- res$query$pages[[1]]
  
  page$extract
}


safe_get_page_text <- possibly(
  get_page_text,
  otherwise = NA_character_
)


annotate_sentence <- function(text) {
  
  udpipe::udpipe_annotate(
    object = m_ita,
    x = text
  ) |>
    as.data.frame()
}
