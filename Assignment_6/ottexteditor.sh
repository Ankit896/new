#!/bin/bash
# set -x
# ./templateEngine.sh template.file key1=value1 key2=value2....

replace_value() {
    while (( "$#" ))
    do
        all_values=$@
        key_value=$1
        key=$(echo "$key_value" |awk -F = '{print $1}')
        value=$(echo "$key_value" |awk -F = '{print $2}')
        # echo $key
        # echo $value
        sed -i "0,/"${key}"/s//"${value}"/" template.file
        shift
    done
}


# ./otTextEditor addLineTop <file> <line>

add_line_at_initial() {
    content="$@"
    echo "$content"
    file_name=("$1")
    shift
    echo $file_name
    text="$@"
    # echo $file_name
    echo "$text"
    sed  -i "1i $text" "$file_name"
}
add_line_at_bottom() {
    content="$@"
    file_name=("$1")
    shift
    text="$@"
    echo -e "$text" >> $file_name
}
# ./otTextEditor addLineAt <file> <linenumber> <line>
add_line_at_specific() {
    content="$@"
    echo "$content"
    file_name=("$1")
    echo $file_name
    shift
    line_number=$1
    shift
    text="$@"
    # echo $file_name
    echo "$text"
    sed  -i ' ${line_number}i $text' $file_name
}
# ./otTextEditor updateFirstWord <file> <word>
update_first_word() {
    content="$@" ; shift
    file_name="$1" ; shift
    word="$@"
    first_word="$(awk '{print $1; exit}' $file_name)"
    sed -i "0,/"$first_word"/s//"${word}"/" template.file
}
# ./otTextEditor updateAllWords <file> <word_to_be_replaced> <replaced_word>
update_all_word() {
    content="$@" ; shift
    file_name="$1" ; shift
    echo $file_name
    word_to_be_replaced="$1" ; shift
    echo $word_to_be_replaced
    replaced_word=$@
    echo $replaced_word
    sed -i "s/$word_to_be_replaced/$replaced_word/g" template.file
}
# ./otTextEditor deleteLine <file> <line no>
delete_line_number() {
    content=$@ ; shift
    file_name="$1" ; shift
    line_number="$@" ; shift
    sed -i "${line_number}d" $file_name
}
# ./otTextEditor deleteLine <file> <line no> <word>
delete_line_have_word() {
    content=$@ ; shift
    file_name="$1" ; shift
    line_number="$1" ; shift
    word="$1" ; shift
    echo $file_name $word $line_number
    sed -i "/$word/d" $file_name
}
help() {
echo "This script can perform following operation :-" ; echo
echo " template         - Replace the value using key=value pair"
echo " addLineTop       - Add a line at top"
echo " addLineBot       - Add a line at bottom"
echo " addLineAt        - Add a line at specific line number"
echo " updateFirstWord  - Replace word"
echo " updateAllWords   - Delete word"
echo " insertWord       - Insert word"
echo " deleteLine       - Delete a line"
echo " deleteLine       - Delete a line containing a word"
}
