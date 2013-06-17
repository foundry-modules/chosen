all: modularize-script minify-script copy-style minify-style lessify-style copy-assets

include ../../build/modules.mk

MODULE		= chosen
MODULARIZE_OPTIONS = -jq

SOURCE_SCRIPT_FOLDER = chosen
SOURCE_SCRIPT_FILE_PREFIX = 
SOURCE_SCRIPT_FILE_SUFFIX = .jquery.js

SOURCE_STYLE_FILE_PREFIX = 

SOURCE_ASSET_FILES = chosen/chosen-sprite.png
TARGET_STYLE_LESS_CONVERTER = sed 's/chosen-sprite.png/@{foundry_uri}\/styles\/chosen\/chosen-sprite.png/g'