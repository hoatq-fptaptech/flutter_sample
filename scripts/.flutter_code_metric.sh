GREEN='\033[1;32m'
RED='\033[0;31m'


echo "${GREEN}========================Flutter Metric Start======================="
RESULT=$?

if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  fvm flutter pub run dart_code_metrics:metrics analyze --fatal-style --fatal-performance --fatal-warnings lib
  RESULT=$? 
else
  echo "Using local flutter version"
  flutter pub run dart_code_metrics:metrics analyze --fatal-style --fatal-performance --fatal-warnings lib
  RESULT=$? 
fi

if [[ $RESULT == "1" ]]; then
    echo "${RED}----> Some files have code metric fatal errors, check Dart Code metric"
    exit 1
else
    echo "----> All code metrics are good :)"
fi
echo "${GREEN}========================Flutter Metric Finish======================="
