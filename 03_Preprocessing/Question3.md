### Considering that the lab already has a pipeline that creates gold standard BAM files from the NGS runs, devise some scripts/source files (in the programming language of your choice) that will generate standard variant files.

 * _Add a comment in your file(s) with the tool(s) that you would use to generate such variants?_
   * Germline mutation caller: GATK-HaplotypeCaller algorithm (Genome Analysis Toolkit), https://gatk.broadinstitute.org/
   * Somatic mutation: Strelka, https://github.com/Illumina/strelka
   * Variant- and Gene-centric visualization: VVA, https://github.com/lootpiz/VVA

 * _We work in a clinical environment, how do you propose to validate these variants? You can add a .md/.txt/.rst file to the directory where this script/program is running with a quick explanation._
   * Experimental validations such as PCR or Fluidigm is the best approaches to validate variants from samples. However, it is challenging to validate all of the variants in error-prone regions (i.e., GC-rich regions) due to limited resources and turn-around time.  
   * Misleading variant-calling errors can occur due to the use of the polymerase reaction and/or mapper-calling algorithms. By closely inspecting the variant calls and read alignment statues, a bioinformatician can determine likely false-positive calls according to the figures generated from the APL-LIMS in BAM/VCF files.
     * Case study: https://doi.org/10.1371/journal.pone.0181304
     * Inspection tool: https://github.com/lootpiz/CaReAl

