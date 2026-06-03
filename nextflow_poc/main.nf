#!/usr/bin/env nextflow

include { CONVERSION_EUBIBRIDGE } from './modules/main.nf'

workflow {
    def ch_images = channel
         .fromPath(params.input_csv, checkIfExists: true)
         .splitCsv(header:true)
         .map { row ->
             def meta = [:]
             meta.id = row.sample
             def image = file(row.image_path) 
             return [meta, image]
         }
    ch_images.view()
    CONVERSION_EUBIBRIDGE(ch_images)
}
