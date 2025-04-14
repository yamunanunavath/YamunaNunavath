# harmonize_script.R
# Author:Yamuna Nunavath
# Purpose: Clean and harmonize species-level abundance data from MetaPhlAn output

# Load libraries
library(tidyverse)
setwd("~/Desktop/SRR31649983")

# Load MetaPhlAn output
raw_data <- read_tsv("Galaxy6-[MetaPhlAn on data 2_ Predicted taxon relative abundances].tabular", comment = "#")

# Rename columns
colnames(raw_data) <- c("Taxon", "Taxon_ID", "Abundance", "NA_Col")

# Keep only species-level entries
species_data <- raw_data %>%
  filter(str_detect(Taxon, "s__")) %>%
  mutate(Species = str_replace(Taxon, ".*s__", ""),
         Species = str_replace_all(Species, "_", " "),
         Rel_Abundance = Abundance / sum(Abundance)) %>%
  filter(Rel_Abundance > 0.01)

# Save harmonized data
write_csv(species_data, "harmonized_SRR31649983.csv")

View(species_data)


# Load plotting library
library(ggplot2)

# Optional: limit to top N species for visualization
top_species <- filtered_data %>%
  arrange(desc(Rel_Abundance)) %>%
  slice_head(n = 10)

# Bar plot
ggplot(top_species, aes(x = reorder(Species, Rel_Abundance), y = Rel_Abundance)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Top 10 Abundant Species (SRR31649983)",
    x = "Species",
    y = "Relative Abundance"
  ) +
  theme_minimal()

ggsave("top_species_plot.png", width = 8, height = 5)




