#!/bin/sh

# Env settings, tools
export GATK=/home/tool/gatk/
export PICARD=/home/tool/picard/
export STRELKA=/home/tool/strelka/

export REF=/storage/home/reference/GATK/hg38
export TMP=/home/scratch/

for i in "APL123456"
do

echo '-----Variant Calling'
java -Xmx10G \
-Djava.io.tmpdir=$TMP \
-jar $GATK/GenomeAnalysisTK.jar \
-R $REF/ucsc.hg19.fasta \
-T UnifiedGenotyper \
-I $i"_sorted_realigned_recaled.bam" \
-o $i"_all.vcf" \
-L S04380110_AllTracks.bed \
--dbsnp $REF/dbsnp_137.hg19.vcf \
-stand_call_conf 30 \
-stand_emit_conf 10 \
-glm BOTH 

echo '-----Var Call-SNV'
java -Xmx10G \
-Djava.io.tmpdir=$TMP \
-jar $GATK/GenomeAnalysisTK.jar \
-R $REF/ucsc.hg19.fasta \
-T SelectVariants \
--variant $i"_all.vcf" \
-o $i"_SNV.vcf" \
-selectType SNP

echo '-----Filtering'
java -Xmx10G \
-Djava.io.tmpdir=$TMP \
-jar $GATK/GenomeAnalysisTK.jar \
-R $REF/ucsc.hg19.fasta \
-T VariantFiltration \
--variant $i"_SNV.vcf" \
-o $i"_filtered_SNV.vcf" \
--filterExpression "QD < 2.0" --filterName "QD2" \
--filterExpression "MQ < 40.0" --filterName "MQ40" \
--filterExpression "FS > 60.0" --filterName "FS60" \
--filterExpression "HaplotypeScore > 13.0" --filterName "HaplotypeScore13" \
--filterExpression "MQRankSum < -12.5" --filterName "MQRankSum-12.5" \
--filterExpression "ReadPosRankSum < -8.0" --filterName "ReadPosRankSum-8"

echo '-----PASSed'
java -Xmx10G \
-Djava.io.tmpdir=$TMP \
-jar $GATK/GenomeAnalysisTK.jar \
-R $REF/ucsc.hg19.fasta \
-T SelectVariants \
--variant $i"_filtered_SNV.vcf" \
-select 'vc.isNotFiltered()' \
-o  $i"_PASS_SNV.vcf"




echo '-----Strelka'
$STRELKA/bin/configureStrelkaSomaticWorkflow.py \
--normalBam $i"_normal.bam" \
--tumorBam $i"_tumor.bam" \
--referenceFasta $REF \
--runDir demo_somatic

echo '==== DONE ===='

done
