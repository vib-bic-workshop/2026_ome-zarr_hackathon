#!/usr/bin/env nextflow

include { CONVERSION_EUBIBRIDGE } from './modules/eubibridge_single/main.nf'
include { CONVERSION_EUBIBRIDGE_CONCATENATION } from './modules/eubibridge_concatenated/main.nf'

workflow {
    if (params.concatenation_axes){
        def ch_images = channel
         .fromPath(params.input_csv, checkIfExists: true)
         .splitCsv(header:true)
         .map { row ->
             def meta = [:]
             meta.id = row.sample
             def image = row.image_path
             return [meta, image]
         }
    ch_images.view()
    CONVERSION_EUBIBRIDGE_CONCATENATION(ch_images)
    } else {
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
}
