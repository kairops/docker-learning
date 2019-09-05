#!/bin/bash

# @description Run bash linter
#
# @example
#   run-bash-linter
#
# @arg $1 Task: "brief", "help" or "exec"
#
# @exitcode The result of the shellckeck
#
# @stdout "Not implemented" message if the requested task is not implemented
#
function run-bash-linter() {

    # Init
    local briefMessage
    local helpMessage

    briefMessage="Run bash linter"
    helpMessage=$(cat <<EOF
Run shellckheck test over the following scripts:

* devcontrol/actions/install-stuff.sh
* devcontrol/actions/run-bash-linter.sh
* devcontrol/global/startup.sh
EOF
)

    # Task choosing
    case $1 in
        brief)
            showBriefMessage "${FUNCNAME[0]}" "$briefMessage"
            ;;
        help)
            showHelpMessage "${FUNCNAME[0]}" "$helpMessage"
            ;;
        exec)
            exitCode=0
            for file in devcontrol/actions/install-stuff.sh devcontrol/actions/run-bash-linter.sh devcontrol/global/startup.sh; do
                echo -n "Running shellcheck bash linter over ${file}..."
                failed=0
                docker run --network none -i --rm --workdir /workspace -v "$(pwd)":/workspace koalaman/shellcheck-alpine shellcheck -x "${file}" || failed=1
                if [ ${failed} -eq 0 ]; then
                    echo "[OK]"
                else
                    echo "-----> Test failed"
                    exitCode=$((exitCode + 1))
                fi
            done
            exit ${exitCode}
            ;;
        *)
            showNotImplemtedMessage "$1" "${FUNCNAME[0]}"
            return 1
    esac
}

# Main
run-bash-linter "$@"
