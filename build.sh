#!/bin/bash
#CONFIGURATION
LIBS=libs
PACKAGE=ru/notecode/program
JAVA_FILES=src/java/$PACKAGE
MAIN_CLASS=Program

mkdir -p bin/obj bin/build

#BUILD
echo "build obj" && \
javac -classpath "${LIBS}/*.jar" -d bin/obj $JAVA_FILES/*.java && \

PACKAGE=`echo $PACKAGE | tr '/' '.'` && \

echo main-class: $PACKAGE.$MAIN_CLASS >>bin/build/manifest.mf && \
echo class-path: $LIBS/*.jar >>bin/build/manifest.mf && \

echo "build jar" && \
jar -cmf bin/build/manifest.mf bin/build/$MAIN_CLASS.jar -C bin/obj . && \

# rm bin/build/manifest.mf && \

#START
echo "start" && \
java -jar bin/build/$MAIN_CLASS.jar

exit 0