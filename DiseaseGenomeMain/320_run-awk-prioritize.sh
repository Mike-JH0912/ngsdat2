#!/bin/bash
set -euo pipefail
id=DRR006760
ref=hg38
forig=${id}.${ref}_multianno.txt
f1=${id}.${ref}_p01_rare.txt
f2=${id}.${ref}_p02_trancate.txt
f3=${id}.${ref}_p02_nonsynonymous.tx
f4=${id}.${ref}_p03_trancate-hom.txt
f5=${id}.${ref}_p03_trancate-het.txt
f6=${id}.${ref}_p03_nonsyn-hom.txt
f7=${id}.${ref}_p03_nonsym-het.txt

Scripts/awk010_ToMMo35KJPNv2.awk \
    ${forig} > ${f1}
Scripts/awk020_TrancateVariants.awk \
    ${f1} > ${f2}
Scripts/awk030_NonsynonymousVariants.awk \
    ${f1} > ${f3}
Scripts/awk040_Homozygous.awk \
    ${f2} > ${f4}
Scripts/awk050_Heterozygous.awk \
    ${f2} > ${f5}
Scripts/awk040_Homozygous.awk \
    ${f3} > ${f6}
Scripts/awk050_Heterozygous.awk \
    ${f3} > ${f7}
fnames=(${forig} ${f1} ${f2} ${f3} ${f4} ${f5} ${f6} ${f7})
for fname in ${fnames[*]}; do
    wc -l ${fname}
done
