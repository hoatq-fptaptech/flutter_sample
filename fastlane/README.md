fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android buildAndroid

```sh
[bundle exec] fastlane android buildAndroid
```

Build Android Version Version Production

### android appCenterAndroidDistribute

```sh
[bundle exec] fastlane android appCenterAndroidDistribute
```

Deploy Android Production via AppCenter

### android playstoreDistribute

```sh
[bundle exec] fastlane android playstoreDistribute
```

Deploy Android Production via Play Console

----


## iOS

### ios buildIOS

```sh
[bundle exec] fastlane ios buildIOS
```

Build app production ios

### ios testFlightDistribute

```sh
[bundle exec] fastlane ios testFlightDistribute
```

Deploy IOS production via Testflight

### ios appCenterIOSDistribute

```sh
[bundle exec] fastlane ios appCenterIOSDistribute
```

Deploy IOS Production via AppCenter

### ios appstoreDistribute

```sh
[bundle exec] fastlane ios appstoreDistribute
```

Deploy IOS production via Appstore

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
