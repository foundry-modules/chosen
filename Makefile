include ../../build/modules.mk

MODULE		= chosen
FILENAME	= ${MODULE}.jquery.js
OUTPUTFILE	= ${MODULE}.js
SOURCE 		= ${MODULE}/${FILENAME}
PRODUCTION	= ${PRODUCTION_DIR}/${OUTPUTFILE}
DEVELOPMENT = ${DEVELOPMENT_DIR}/${OUTPUTFILE}
PRODUCTION_FOLDER	= ${PRODUCTION_DIR}/${MODULE}
DEVELOPMENT_FOLDER	= ${DEVELOPMENT_DIR}/${MODULE}

all: premake body assets

premake:
	mkdir -p ${DEVELOPMENT_FOLDER}
	mkdir -p ${PRODUCTION_FOLDER}

body:
	${MODULARIZE} -jq -n "${MODULE}" ${SOURCE} > ${DEVELOPMENT}
	${UGLIFYJS} ${DEVELOPMENT} > ${PRODUCTION}

assets:

	# Create css folder
	mkdir -p ${DEVELOPMENT_FOLDER}/
	mkdir -p ${PRODUCTION_FOLDER}/

	cp -Rp chosen/*.css ${DEVELOPMENT_FOLDER}/
	cp -Rp chosen/*.png ${DEVELOPMENT_FOLDER}/

	cp -Rp chosen/*.css ${PRODUCTION_FOLDER}/
	cp -Rp chosen/*.png ${PRODUCTION_FOLDER}/

clean:
	rm -rf ${DEVELOPMENT}
	rm -rf ${DEVELOPMENT_FOLDER}
	rm -rf ${PRODUCTION}
	rm -rf ${PRODUCTION_FOLDER}