# Changelog

## [2.0.0](https://github.com/catppuccin/cursors/compare/v1.0.2...v2.0.0) (2024-12-27)


### ⚠ BREAKING CHANGES

* implement nominal_size metadata for hyprcursor

### Features

* implement nominal_size metadata for hyprcursor ([6649d37](https://github.com/catppuccin/cursors/commit/6649d37f3cd6fbaf814733215f735806cc1c7f2d))

## [1.0.2](https://github.com/catppuccin/cursors/compare/v1.0.1...v1.0.2) (2024-12-03)


### Bug Fixes

* alias svg-&gt;png generation failing ([#57](https://github.com/catppuccin/cursors/issues/57)) ([42d57f7](https://github.com/catppuccin/cursors/commit/42d57f790c0bac1c9948063fb8b548a67adfe2af))
* build hyprcursor with svgs (again) ([#55](https://github.com/catppuccin/cursors/issues/55)) ([fc88cfb](https://github.com/catppuccin/cursors/commit/fc88cfb1f01d8dc19849d4ccb331e1ade704afa4))
* latte dark/light being inverted ([#60](https://github.com/catppuccin/cursors/issues/60)) ([652fa31](https://github.com/catppuccin/cursors/commit/652fa31e8ef9fcf4c026a41751ceb8ce3977c366))


### Build system & distribution

* batch svgs for inkscape (again) ([#54](https://github.com/catppuccin/cursors/issues/54)) ([cec18c8](https://github.com/catppuccin/cursors/commit/cec18c83ceb51e6aa184af4a666d1e05b1aaf5f8))
* **svgs:** link `fleur` to `all-scroll` ([#58](https://github.com/catppuccin/cursors/issues/58)) ([f3c116b](https://github.com/catppuccin/cursors/commit/f3c116b1fc6a04a25fd22f18746e0de7451b4a3e))

## [1.0.1](https://github.com/catppuccin/cursors/compare/v1.0.0...v1.0.1) (2024-10-25)


### Bug Fixes

* pointer & corner hotspots ([#47](https://github.com/catppuccin/cursors/issues/47)) ([5a5a4a9](https://github.com/catppuccin/cursors/commit/5a5a4a9d5d3159ff51170e2107732f77aff12607))


### Build system & distribution

* maintain symlinks in built zips ([#51](https://github.com/catppuccin/cursors/issues/51)) ([571d2b6](https://github.com/catppuccin/cursors/commit/571d2b6321b47ad3f0646399d77a896d3f990a02))

## [1.0.0](https://github.com/catppuccin/cursors/compare/v0.4.0...v1.0.0) (2024-10-20)


### ⚠ BREAKING CHANGES

* generate all sizes of cursors from 16px -> 96px

### Features

* use breeze scripts to build xcursors & plasma scalable SVGs ([3c9b12e](https://github.com/catppuccin/cursors/commit/3c9b12e9f209689aba221053d8e5d9f6bfa26872))


### Bug Fixes

* generate all sizes of cursors from 16px -&gt; 96px ([3c9b12e](https://github.com/catppuccin/cursors/commit/3c9b12e9f209689aba221053d8e5d9f6bfa26872))


### Build system & distribution

* generate SVGs at runtime with catppuccin/whiskers ([56d43e4](https://github.com/catppuccin/cursors/commit/56d43e48faadbda5d3d2429a720a9b34d81f8175))

## [0.4.0](https://github.com/catppuccin/cursors/compare/v0.3.1...v0.4.0) (2024-10-14)


### Features

* support Plasma's SVG cursors implementation ([#37](https://github.com/catppuccin/cursors/issues/37)) ([4bcb0c1](https://github.com/catppuccin/cursors/commit/4bcb0c163f5240b78627b7d246e24465b388538b))


### Build system & distribution

* **release-please:** remove `draft: true` ([#38](https://github.com/catppuccin/cursors/issues/38)) ([71c2d66](https://github.com/catppuccin/cursors/commit/71c2d66b1d5e4936efbfe726f080062ec003ee04))

## [0.3.1](https://github.com/catppuccin/cursors/compare/v0.3.0...v0.3.1) (2024-06-09)


### Bug Fixes

* **hyprcursor:** solve application consistency and scaling ([#29](https://github.com/catppuccin/cursors/issues/29)) ([4ed2c6a](https://github.com/catppuccin/cursors/commit/4ed2c6a76613825ea59e3edff50818353354a396))

## [0.3.0](https://github.com/catppuccin/cursors/compare/v0.2.1...v0.3.0) (2024-05-31)


### Features

* support `hyprcursor` ([#23](https://github.com/catppuccin/cursors/issues/23)) ([28cb6d2](https://github.com/catppuccin/cursors/commit/28cb6d2a81e7046400eb177f7131b15507468c57))

## [0.2.1](https://github.com/catppuccin/cursors/compare/v0.2.0...v0.2.1) (2024-05-28)


### Performance Improvements

* exponential speed-up in build time ([a8aa241](https://github.com/catppuccin/cursors/commit/a8aa241c085d1b318097f77d1be807a57af45417))


### Build system & distribution

* generate zips in lowercase ([a8aa241](https://github.com/catppuccin/cursors/commit/a8aa241c085d1b318097f77d1be807a57af45417))
* use release-please ([#20](https://github.com/catppuccin/cursors/issues/20)) ([d3aa4fd](https://github.com/catppuccin/cursors/commit/d3aa4fde72e57b5e189bec6ade36ffdbbe32a3d8))
