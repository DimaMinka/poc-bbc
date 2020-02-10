# common functions

fatal() {
    echo "fatal: $*" >&2
    exit 1
}

read_saved_token() {
    [[ -f "$token_sh_file" ]] || fatal "token file $token_sh_file does not exist; run ./get-access-token.sh first"

    . "$token_sh_file"

    [[ ${token+x} ]] || fatal "variable 'token' is not defined; it's expected in $token_sh_file; run ./get-access-token.sh to fix"
}

curl() {
    echo "+ curl $*" >&2
    command curl "$@"
}
