#!/bin/ksh

readonly RUN_PATH=${.sh.file} ;
readonly RUN_BASE=$(dirname  ${RUN_PATH});

function writeConsole {
  TIMESTAMP=$( date +%Y-%m-%d][%T.%3N )
  echo "[${TIMESTAMP}]${*}"
}

function buildImage {
    PATH_DOCKER_FILE=$1
    IMAGE_NAME=$2
    IMAGE_VERSION=$3
    writeConsole "[info] Procedemos a construir la imagen $PATH_DOCKER_FILE con el nombre $IMAGE_NAME version $IMAGE_VERSION"
    docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} ${PATH_DOCKER_FILE}
    if [ ${?} != 0 ] ; then
        writeConsole "[error] No se pudo construir el contenedor"
        exit -1
    fi
}

function pushImage {
    PATH_DOCKER_FILE=$1
    IMAGE_NAME=$2
    writeConsole "[info] Procedemos a pushear la imagen $PATH_DOCKER_FILE con el nombre $IMAGE_NAME version $IMAGE_VERSION"
    docker push ${IMAGE_NAME}:${IMAGE_VERSION}
    if [ ${?} != 0 ] ; then
        writeConsole "[error] No se pudo pushear el contenedor"
        exit -1
    fi
}

function buildAndPushImage {
    buildImage $1 $2 $3
    pushImage $1 $2
}

function main {
    writeConsole "[info] Iniciamos la construcción de las imagenes"
    DEFAULT_USER="own3dh2so4"

    writeConsole "[info] Construimos la imagen base, el usuario que se usará: ${DEFAULT_USER}"
    buildAndPushImage "${RUN_BASE}/base-image" "$DEFAULT_USER/base-jenkins-slave" "1.0"
    buildAndPushImage "${RUN_BASE}/base-image" "$DEFAULT_USER/base-jenkins-slave" "latest"

    writeConsole "[info] Construimos la imagen java, el usuario que se usará: ${DEFAULT_USER}"
    buildAndPushImage "${RUN_BASE}/java-image" "$DEFAULT_USER/java-jenkins-slave" "openjdk8"
    buildAndPushImage "${RUN_BASE}/java-image" "$DEFAULT_USER/java-jenkins-slave" "latest"

    writeConsole "[info] Construimos la imagen gradle, el usuario que se usará: ${DEFAULT_USER}"
    buildAndPushImage "${RUN_BASE}/gradle-image" "$DEFAULT_USER/gradle-jenkins-slave" "3.4.1"
    buildAndPushImage "${RUN_BASE}/gradle-image" "$DEFAULT_USER/gradle-jenkins-slave" "latest"

    writeConsole "[info] Construimos la imagen sbt, el usuario que se usará: ${DEFAULT_USER}"
    buildAndPushImage "${RUN_BASE}/sbt-image" "$DEFAULT_USER/sbt-jenkins-slave" "0.13.8"
    buildAndPushImage "${RUN_BASE}/sbt-image" "$DEFAULT_USER/sbt-jenkins-slave" "latest"

    writeConsole "[info] Todas las imagenes se han creado correctamente"


}

main