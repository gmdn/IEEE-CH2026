# IEEE-CH2026 annotation resources

> **Research use only. Not a medical device.**
> This resource was developed in the HEREDITARY project as a research prototype. It has not been assessed or certified under the EU Medical Device Regulation (EU) 2017/745. It must not be used to diagnose, treat, monitor or make any other decision about individual patients.

## 1. Overview

| Field | Value |
|---|---|
| Name | IEEE-CH2026 annotation resources |
| Version | v1.0 |
| Type | Dataset and annotation resources |
| Owner partner and contact | University of Padua (UNIPD); Giorgio Maria Di Nunzio, giorgiomaria.dinunzio@unipd.it|
| License | Apache-2.0 |
| Repository and DOI | https://github.com/gmdn/IEEE-CH2026 |
| Release date | Actual |
| Related task or deliverable | WP4; misuse assessment contributes to D9.1 |
| How to cite | Giorgio Maria Di Nunzio (2026). *A Modular Pipeline for Multi-Layer Annotation and Curation of Cultural Heritage Texts*. [Author preprint](https://www.dei.unipd.it/~dinunzio/publications/di-nunzio-modular-pipeline-multi-26/paper.pdf).|

## 2. Intended use

**Primary intended use.** Research on linguistic and terminological annotation of cultural heritage texts. The accompanying paper describes a workflow combining IMPACT and AnnotaTerm.

**Intended users.** Researchers, developers, annotators and cultural heritage specialists.

**Out-of-scope uses.** This release must not be used for:
- clinical diagnosis, prognosis or treatment of individual patients;
- decisions about individuals, such as insurance, employment or access to care;
- re-identification, surveillance, or unauthorized linkage or processing of personal information;
- inference of a living person's political beliefs, affiliations or other sensitive characteristics;
- automatic claims about people or groups without source verification and contextual expert review;
- populations, languages, text types or applications outside the documented scope without separate validation.

These statements describe the intended research scope and responsible-use guidance. They do not amend or replace the applicable license.

## 3. Data provenance

| Dataset | Source partner | Type | Population or corpus | Ethics approval or access conditions |
|---|---|---|---|---|
| Italian Resistance annotation case study | UNIPD; source texts from Italian Wikipedia | Public encyclopedic text and derived annotations; not described as anonymized | Paper reports 407 sentences from 58 pages, selected from 6,076 sentences. Historical material, not a patient cohort. Age/sex breakdown: not reported. | Publicly accessible source |

Source category: https://it.wikipedia.org/wiki/Categoria:Resistenza_italiana

**Personal information.** Public historical text can contain names and biographical or political references. It must not automatically be described as anonymous or free of personal information.

## 4. Method

- **Algorithm or architecture.** Modular annotation and expert curation; morphosyntactic outputs in CoNLL-U and semantic/fragment annotations in JSON are described in the paper.
- **Training setting.** No new training experiment is reported for this resource.
- **Privacy techniques.** None reported for this resource. No differential-privacy, anonymization or secure-aggregation guarantee is claimed.

This README covers this repository's release. It does not certify separate distributions or deployments of IMPACT or AnnotaTerm.

## 5. Performance

- **Evaluation data.** Exploratory cultural heritage case study; no held-out validation is reported.
- **Metrics and results.** No quantitative annotation-accuracy evaluation or inter-annotator agreement is reported. Corpus size is not an accuracy estimate.
- **Results by subgroup.** Not reported; no clinical subgroup evaluation is provided.

## 6. Known limitations and risks

- **Generalizability.** Results from a limited historical corpus do not establish suitability for other languages, periods, genres or domains.
- **Known biases and confounders.** Historical coverage, source selection and interpretive labeling may affect downstream conclusions. An annotation is not independent proof of a historical claim or a person's beliefs.
- **Failure modes.** Ambiguous references, discontinuous spans, incorrect labels, source changes and loss of context can produce misleading interpretations. Review source passages before reuse.
- **Privacy risks.** Named entities may facilitate linkage to other information. Do not use annotations for identifying, profiling or making decisions about living individuals. No membership-inference or inversion result is reported; applicability depends on whether a trained component is actually released.
- **Misuse assessment.** A provisional limited-risk assessment has been drafted. It is not an ethics approval; the owner must verify release contents, privacy checks and implemented safeguards before signing.

## 7. Responsible use and reporting

- **Terms of use.** Follow the applicable LICENSE file and third-party source conditions. Preserve source context when redistributing derived material.
- **Expert review.** Check annotations against source passages before making scholarly claims.
- **Contact for misuse or vulnerability reports.** giorgiomaria.dinunzio@unipd.it. 

## 8. Acknowledgement

Partially funded by the European Union under grant agreement No 101137074 (HEREDITARY). Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Health and Digital Executive Agency (HaDEA). Neither the European Union nor the granting authority can be held responsible for them.
