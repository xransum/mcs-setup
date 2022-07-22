#!/bin/bash

# Fix working directory to adjust to ensure absolute pathings
cd -- "$(dirname "$0")"

# Better script debugging
if [ x${FTB_VERBOSE} = xyes ]; then
	set -x
fi

# Read pack related settings from local settings file
if [ -f ./settings ]; then
	. ./settings.sh
else
	echo "No settings file found in ./settings... Skipping."
	sleep 2
fi

server_startup() {
		java -server -Xms${MIN_RAM} \
		-Xmx${MAX_RAM} \
		-XX:PermSize=${PERMGEN_SIZE} \
		${JAVA_PARAMETERS} \
		-jar ${FORGE_JAR} \
		nogui
}

# run install script if MC server or LAUNCHER_WRAPPER_JAR s missing
if [ ! -f ${LAUNCHER_JAR} -o ! -f libraries/${LAUNCHER_WRAPPER_JAR} ]; then
    echo "Uh-oh! Looks like you're missing the necessary jars, " \
		"let's fix that for you."
    echo "Please wait while we fetch everything for you."

	WRAPPER_PATH="$(dirname libraries/${LAUNCHER_WRAPPER_JAR})"
	if [ ! -d "${WRAPPER_PATH}" ]; then
		mkdir -p "$(dirname libraries/${LAUNCHER_WRAPPER_JAR})"
	fi

	if command -v wget &> /dev/null; then
		wget "https://s3.amazonaws.com/Minecraft.Download/versions/${LAUNCHER_VERSION}/${LAUNCHER_JAR}" -O ${LAUNCHER_JAR}
		wget "https://libraries.minecraft.net/${LAUNCHER_WRAPPER_JAR}" -O libraries/${LAUNCHER_WRAPPER_JAR}
	else
		if command -v curl &> /dev/null; then
			curl "https://s3.amazonaws.com/Minecraft.Download/versions/${LAUNCHER_VERSION}/minecraft_server.${LAUNCHER_VERSION}.jar" -o ${LAUNCHER_JAR}
			curl "https://libraries.minecraft.net/${LAUNCHER_WRAPPER_JAR}" -o libraries/${LAUNCHER_WRAPPER_JAR}
		else
			echo "You seem to not have either commands: wget or curl, and one of them is" \
				"required to continue."
			exit
		fi
	fi
fi

# Eula be always true
if [ ! -f eula.txt ] && ! grep -q "eula=true" eula.txt; then
	echo "Eula has been overwritten to true."
	echo "eula=true" > eula.txt
fi

echo "Beginning server startup..."
rm -f autostart.stamp

server_startup
while [ -e autostart.stamp ] ; do
    rm -f autostart.stamp

	echo "To completely stop the server now, use CTRL+C before the countdown finishes!"

	echo -n "Restarting server in"
	for n in {5..1}; do
		echo -n " $n"
		sleep 1
	done
	echo "."

	echo "Server rebooting."
	server_startup
done

