#!/bin/bash

# That function read the LKMPG.org file and create examples code according
# to the code that can be read in the guide

main=LKMPG-5.2.5.org
copy=/tmp/lkmpg_examples
begin=0
end=0
length=0
examples='examples'

cp "${main}" "${copy}"

# Function used to know if the copied guide still contains code or if
# all code has been extracted
# Return 0 if still contain code
# Return 1 if no more code
contain_code()
{
    grep -in \#+BEGIN_SRC ${copy} > /dev/null
    main_programm_still_contain_code=$?
    if [ ${main_programm_still_contain_code} -eq 0 ] ; then
        grep -in \#+END_SRC ${copy} > /dev/null
        main_programm_still_contain_code=$?
    fi
    return ${main_programm_still_contain_code}
}

# Create example directory
if [ ! -d $examples/img ]; then
    mkdir -p $examples/img
fi
if [ ! -d $examples/other ]; then
    mkdir -p $examples/other
fi

# Main function
contain_code
while [ $? -eq 0 ]; do
    begin=$(grep -in \#+BEGIN_SRC ${copy} | cut -d':' -f1 | head -n 1)
    end=$(grep -in \#+END_SRC ${copy} | cut -d':' -f1 | head -n 1)

    begin=$(( begin + 1 ))
    end=$(( end - 1 ))
    length=$(( end - begin + 1 ))

    # Get file name from example
    file_name=$(grep -in \#+BEGIN_SRC ${copy} | awk -F ':file' '{print $2}' | head -n 1)

    # If file exist
    if [ -n "${file_name}" ]; then
        # Create file
        cd $examples || exit 1
        tail -n +${begin} ${copy} | head -n ${length} > ${file_name}
        cd ..
    fi

    # Update file
    end=$(( end + 2 ))
    tail -n +${end} ${copy} > ${copy}.new
    mv ${copy}.new ${copy}

    # Check if initial guide contain code
    contain_code
done

rm ${copy}
cp examples_makefile $examples/Makefile

exit 0
