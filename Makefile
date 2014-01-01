# npm install -g uglify-js

MIN=build/wavesurfer.min.js
AMD=build/wavesurfer.amd.js
SOURCE_MAP=build/wavesurfer-js-map.json
SOURCE_MAP_ROOT=/
SOURCES=src/wavesurfer.js\
        src/webaudio.js\
        src/drawer.js\
        src/drawer.*.js

$(MIN): $(SOURCES)
	uglifyjs --lint -cm -o $@ $^ \
--source-map=$(SOURCE_MAP) --source-map-root=$(SOURCE_MAP_ROOT) \
--source-map-url=$(SOURCE_MAP_ROOT)$(SOURCE_MAP)

amd: $(SOURCES)
	echo "define(function () {" > $(AMD)
	uglifyjs $^ -cm >> $(AMD)
	echo "\n;return WaveSurfer; });" >> $(AMD)

.PHONY: amd
