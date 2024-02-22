GREEN='\033[1;32m'

echo "${GREEN}========================Code Analyze Start======================="

if [ -z "$GITLAB_CI" ]; then
    if ! sh scripts/.flutter_code_metric.sh; then
        exit 1
    fi
fi
if ! sh scripts/.flutter_analyze.sh; then
    exit 1
fi
dart format . --set-exit-if-changed
if ! sh scripts/.format_import.sh; then
    exit 1
fi

echo "${GREEN}========================Code Analyze Finish======================="
