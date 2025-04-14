# Data Harmonizing for SRR31649983 - Colorectal Cancer Metagenomic Data

## Project Overview

This project processes and harmonizes species-level microbial abundance data from colorectal cancer stool samples (dataset: SRR31649983). Raw data was analyzed using MetaPhlAn, and this script produces a clean, analysis-ready abundance table.

## Data Source

- **Input:** MetaPhlAn output file (`.tabular`) from Galaxy workflow
- **Output:** Cleaned `.csv` file with:
  - Only species-level taxa (s__)
  - Cleaned species names
  - Normalized abundance values
  - Filtered species with relative abundance >1%

## Files Included

| File Name                | Description                           |
|--------------------------|---------------------------------------|
| `harmonize_script.R`     | R script for data harmonization       |
| `harmonized_manifest.csv`| Cleaned and filtered abundance table  |
| `Data Harmonizing.Rproj` | RStudio project file                  |

## Weekly Goal

- Load and preprocess MetaPhlAn output
- Normalize and clean species names
- Filter by abundance threshold
- Export harmonized dataset
- Push everything to GitHub


