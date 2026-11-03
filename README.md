> **Research use only. Not a medical device.**
> This software was developed also in the context of the HEREDITARY project as a research prototype. It has not been assessed or certified under the EU Medical Device Regulation (EU) 2017/745. It must not be used to diagnose, treat, monitor or make any other decision about individual patients.

# IEEE-CH2026

This repository accompanies the paper "A Modular Pipeline for Multi-Layer Annotation and Curation of Cultural Heritage Texts", presented at the IEEE Conference on Cultural Heritage ([IEEE-CH 2026](https://www.ieee-ch.org/)).

The repository contains the datasets, scripts, and annotation resources used to support the case study described in the paper, which explores the integration of morphosyntactic and semantic annotation workflows for cultural heritage texts. The experimental corpus was derived from Italian Wikipedia pages related to the Italian Resistance movement and was processed through a modular annotation pipeline combining UDPipe-based linguistic analysis with terminology-oriented semantic annotation.

## Repository Structure

```text
.
├── README.md
├── data/
├── scripts/
```

### `data/`

This directory contains serialized R objects (`.rds`) generated during the corpus construction and annotation workflow. These files are provided to facilitate reproducibility and to avoid repeated requests to external services.

Typical contents include:

* `pages_raw.rds`: Wikipedia pages retrieved from the source category.
* `candidate_sentences.rds`: Sentences selected for annotation.
* `token_annotations.rds`: UDPipe morphosyntactic annotations.
* Any additional intermediate datasets produced during processing.

### `scripts/`

This directory contains the scripts used to reproduce the workflow described in the paper.

* `scraping.R` – Retrieval of Wikipedia pages through the MediaWiki API.
* `preprocess.R` – Corpus cleaning and sentence segmentation.
* `process_like_impact.R` – Morphosyntactic annotation workflow based on UDPipe.
* `process_like_annotaterm.R` – Candidate terminology extraction and semantic annotation preparation.
* `helpers.R` - Utility functions used throughout the workflow, including API access, data transformation, and preprocessing helpers.

## Reproducibility

Users may either:

1. Run the complete workflow from the raw Wikipedia sources using the scripts provided in `scripts/`; or
2. Load the intermediate `.rds` files from `data/` to reproduce the analyses without performing a new download.

Example:

```r
pages <- readRDS("data/pages_raw.rds")
token_annotations <- readRDS("data/token_annotations.rds")
```


## Acknowledgement

Partially Funded by the European Union under grant agreement No 101137074 (HEREDITARY). Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Health and Digital Executive Agency (HaDEA). Neither the European Union nor the granting authority can be held responsible for them.
