GREEN='\033[1;32m'

echo "${GREEN}========================Setup App Start======================="
if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  fvm use 3.16.7
  fvm flutter doctor -v
  fvm flutter clean
  fvm flutter pub get
  dart pub global activate flutter_gen
  fvm dart run build_runner build -d

else
  echo "Using local flutter version"
  flutter doctor -v
  flutter clean
  flutter pub get
  dart pub global activate flutter_gen
  dart run build_runner build -d
fi
echo "${GREEN}========================Setup App Finish======================="
