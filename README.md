Hello there, Greetings!

I've set up this repository specifically aimed at generating and illustrating the phylogenetic tree for COVID-19 strains responsible for fatalities, sourced from the GISAID database.

Initially, the COVID-19 strains from the Asia/India region, employing specific criteria such as high coverage, host (human), and patient status were selected. From the vast pool of 8765 strains initially obtained, I narrowed it down to 485 strains associated with fatal cases. Subsequently, the FASTA sequences and corresponding metadata from GISAID were retrieved.

Next, the FASTA sequences were subsetted to isolate the 485 desired strains using R.

Augur toolkit, a pivotal component of the Nextstrain project, was then utilized to construct the phylogenetic tree. Augur's output, stored in JSON format, was integrated into Auspice.us for visualization. The additional metadata was added to the JSON tree in Auspice.us, before downloading it in .nexus format.

Finally, employed Figtree software to visually enhance and design the phylogenetic tree for comprehensive analysis.
