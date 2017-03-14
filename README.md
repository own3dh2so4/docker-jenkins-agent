# Docker Jenkins Agent

En este repositorio se encuentran images docker destinadas a ser agentes jenkins.

Actualmemte tenemos 4 imagenes:
* Base: Alpine Linux con los paquetes necesarios para la instalación de las dependecias que se necesitarán en las siguientes imagenes
* Java: Extiende de la imagen Base y le añade el OpenJdk8
* Gradle: Extiende de la imagen Java añadiendo una instalación de gradle
* Sbt: Extiende de la imagen con Gradle y admás tiene la herramienta SBT.

Para construir todas las imagenes se facilita un script run.sh