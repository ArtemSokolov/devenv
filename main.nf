process launcher {
    container "ghcr.io/artemsokolov/devenv:${env}-latest"
    containerOptions "--rm"

    input:
        val(env)

    output:
        stdout

    """
    /usr/local/bin/code tunnel user login --provider github
    /usr/local/bin/code tunnel --random-name
    """
}

workflow {
    // Argument verification
    if (!params.env) {
        error "Input file parameter '--env' is required"
      }

    channel.from(params.env) | launcher | view
}
