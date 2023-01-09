#!/bin/bash

if ! command -v swiftlint &> /dev/null; then
  echo "swiftlint is not installed! Use:"
  tput setaf 7 # white
  echo
  echo '    brew install swiftlint'
  echo
  tput sgr0 # reset
  exit 1
fi

lint_dirs=(
	"StripeCore"
)

exit_code=0
for dir in $lint_dirs; do
	swiftlint --strict "$dir/"
	code=$?
	if [ "$code" != "0" ]; then
		exit_code=$code
	fi
done
exit $exit_code