###################################################
# Server Environment Configs for server_start.sh
#
# TODO:
# * Updated to newest Mojang repositories.
###################################################

# Package specific environment variables, not intended for edit unless
# you know what you're doing.
export LAUNCHER_VERSION="1.10.2"
export LAUNCHER_JAR="minecraft_server.${LAUNCHER_VERSION}.jar"
export LAUNCHER_WRAPPER_VERSION="1.12"
export LAUNCHER_WRAPPER_JAR="net/minecraft/LAUNCHER_WRAPPER_JAR/${LAUNCHER_WRAPPER_VERSION}/LAUNCHE$
#export FORGE_VERSION="12.18.3.2477"
#export FORGE_JAR="forge-${LAUNCHER_VERSION}-${FORGE_VERSION}.jar"
export FORGE_JAR="forge-1.10.2-12.18.3.2477.jar"

# Default environment variables for executing with JVM.
export MIN_RAM="1024M"        # -Xms
export MAX_RAM="6144M"        # -Xmx
export PERMGEN_SIZE="256M"    # -XX:PermSize
export JAVA_PARAMETERS="-XX:+UseParNewGC " \
        "-XX:+CMSIncrementalPacing " \
        "-XX:+CMSClassUnloadingEnabled " \
        "-XX:ParallelGCThreads=2 " \
        "-XX:MinHeapFreeRatio=5 " \
        "-XX:MaxHeapFreeRatio=10"
