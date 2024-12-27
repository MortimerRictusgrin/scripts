guix shell --container --network --emulate-fhs --preserve='^DISPLAY$' alsa-lib libgccjit bash \
	glibc coreutils torbrowser dbus-glib file gcc-toolchain grep gtk+ libcxx pciutils sed -- ./start-tor-browser.desktop -v
