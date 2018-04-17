< config.mk

DATOS=`{find -L data/ -name '*.vcf.gz' | sed "s/^/-vcfs /"}

results/SamplePON.vcf.gz:
        set -x
        mkdir -p $(dirname $target)
        java -jar $GATK \
                CreateSomaticPanelOfNormals \
                $DATOS \
                -O $target".build" \
        && mv $target".build" $target \
	&& mv $target".build.idx" $target".idx"



