GREEN='\033[1;32m'
RED='\033[0;31m'

echo "${GREEN}========================Flutter Analyze Start======================="
RESULT=""

if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  RESULT=$(fvm flutter analyze --no-pub --no-fatal-infos --no-fatal-warnings)
else
  echo "Using local flutter version"
  RESULT=$(flutter analyze --no-pub --no-fatal-infos --no-fatal-warnings)
fi

if [[ $RESULT == *"info •"* ]] || [[ $RESULT == *"warning •"* ]]; then
    echo "${RED}----> Some files have linter fatal errors, check Dart Analysis"
    echo ${RESULT}
    exit 1
else
    echo "----> All analyzes are good :)"
fi
echo "${GREEN}========================Flutter Analyze Finish======================="
