#!/bin/sh
DOCKER_IMAGE=$1
DOCKER_RUN="docker run --rm -i -v $(pwd):/local -w /local ${DOCKER_IMAGE}"

CMD="rm -rf hello_world && \
    mkdir hello_world && \
    cd hello_world && \
    java -jar /opt/flix/flix.jar init 1>&2 && \
    cp ../hello_world.flix src/Main.flix && \
    java -jar /opt/flix/flix.jar build 1>&2 && \
    java -jar /opt/flix/flix.jar build-jar 1>&2 && \
    java -jar artifact/hello_world.jar"
RESULT="$(${DOCKER_RUN} sh -c "${CMD}")"
echo "${RESULT}"
if [ "${RESULT}" = "Hello, world!" ]
then
    echo "PASSED"
else
    echo "FAILED"
    exit 1
fi
