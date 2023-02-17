BINARY=helloworld

linux:
	# build for linux
	@rm -f helloworld_x86_64
	@cross build --target x86_64-unknown-linux-gnu --release
	@mv target/x86_64-unknown-linux-gnu/release/${BINARY} helloworld_x86_64

arm: 
	# build for arm
	@rm -f helloworld_aarch64
	@cross build --target aarch64-unknown-linux-gnu --release
	@mv target/aarch64-unknown-linux-gnu/release/${BINARY} helloworld_aarch64

armv7:
	# build for arm
	@rm -f helloworld_armv7
	@cross build --target armv7-unknown-linux-gnueabihf --release
	@mv target/armv7-unknown-linux-gnueabihf/release/${BINARY} helloworld_armv7


.PHONY: linux arm armv7
