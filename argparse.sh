#! /bin/sh -

# idiomatic parameter and option handling in sh
# http://superuser.com/questions/186272/check-if-any-of-the-parameters-to-a-bash-script-match-a-string
while test $# -gt 0
do
    case "$1" in
        --opt1) echo "option 1"
            ;;
        --opt2) echo "option 2"
            ;;
        --*) echo "bad option $1"
            ;;
        *) echo "argument $1"
            ;;
    esac
    shift
done

exit 0
