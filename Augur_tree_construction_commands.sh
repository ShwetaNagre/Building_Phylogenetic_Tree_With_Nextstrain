curl -fsSL --proto '=https' https://nextstrain.org/cli/installer/linux | bash

nextstrain setup --set-default conda

printf '\n%s\n' 'eval "$("/home/shweta/.nextstrain/cli-standalone/nextstrain" init-shell bash)"' >> ~/.bashrc
eval "$("/home/shweta/.nextstrain/cli-standalone/nextstrain" init-shell bash)"

nextstrain setup --set-default conda

nextstrain shell .

augur --help

augur align --sequences /home/shweta/Downloads/GISAID/Filtered_sequences.fasta --output /home/shweta/Downloads/GISAID/Alignment.fasta --reference-sequence /home/shweta/Downloads/GISAID/EPI_ISL_402124-ORF1ab.fasta


augur tree --alignment /home/shweta/Downloads/GISAID/Alignment.fasta  --output /home/shweta/Downloads/GISAID/Dead_patients_covid_strain_tree.nwk

augur export v2 --tree /home/shweta/Downloads/GISAID/Dead_patients_covid_strain_tree.nwk --metadata /home/shweta/Downloads/GISAID/gisaid_hcov-19_2024_02_26_metadata.tsv --metadata-id-columns Strain_name --output /home/shweta/Downloads/GISAID/annotated_tree.json

exit
