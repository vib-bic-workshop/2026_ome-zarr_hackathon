process CONVERSION_EUBIBRIDGE {
    label 'process_single'

    //container 'bugraoezdemir/eubi-bridge:0.1.2b3'
    
    input:
    tuple val(meta), path(image, stageAs: 'input/*')
    output:
    tuple val(meta), path("*.zarr"), emit: converted
   // path "versions.yml", emit: versions

    script:
    def args = task.ext.args ?: ''
    """
    eubi to_zarr input ./ --max_workers ${task.cpus} $args
  #  cat <<-END_VERSIONS > versions.yml
   # "${task.process}":
   #     python: \$(python --version | sed 's/Python //g')
   # END_VERSIONS
    """
    
   // stub:
   // """
   // touch test.ome.zarr

    //"""    
    // cat <<-END_VERSIONS > versions.yml
    // "${task.process}":
    //     python: \$(python --version | sed 's/Python //g')
    // END_VERSIONS
}
