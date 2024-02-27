# Load required libraries
library(seqinr)
library(dplyr)

# Read metadata
metadata <- read.table("/home/shweta/Downloads/GISAID/gisaid_hcov-19_2024_02_26_metadata.tsv", sep="\t", header=TRUE)

# Filter metadata to get IDs of strains that resulted in patient deaths
death_strain_ids <- metadata$Strain_name[metadata$Patient.status == "Death"]

# Read FASTA file and subset sequences
Fasta_sequences <- read.fasta("/home/shweta/Downloads/GISAID/gisaid_hcov-19_2024_02_26_13.fasta")

# Filter sequences based on strain IDs of died patients
death_strain_sequences <- lapply(Fasta_sequences, function(seq_entry) {
  id <- attr(seq_entry, "name")
  if (id %in% death_strain_ids) {
    return(seq_entry)
  } else {
    return(NULL)
  }
})

# Remove NULL entries and write filtered sequences to a new FASTA file
death_strain_sequences <- Filter(Negate(is.null), death_strain_sequences)

write.fasta(death_strain_sequences, names = death_strain_ids,
file = "/home/shweta/Downloads/GISAID/Filtered_sequences.fasta",
open = "w", nbchar = 60)
