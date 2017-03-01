build-neko:
	openfl build neko -debug

run-neko:
	openfl test neko -debug

build-html5:
	openfl build html5 -debug

run-html5:
	openfl test html5 -debug

backport-patch:
	export HXL_PATH=`haxelib config` && \
	export AS_PATH=${PATH}/lime/2,9,1/lime/audio/AudioSource.hx && \
	if [ -e ${AS_PATH} ] && grep ${AS_PATH} "private var samples:Int;"; then \
	echo "already patched"; \
	else echo "not yet patched"; \
	fi

clean:
	rm -rf export/*

