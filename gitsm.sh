commit () {
    echo "Enter the sub module directory; example use the / command"#change the capital simple
    read text
    echo "Enter the commit"
    read COMMIT

    cd $text

    IFS='/'
    read -a strarr <<< "$text"
    echo ${#strarr[@]}


    for val in "${strarr[@]}";
    do
    git add .
    git commit -m "$COMMIT"
    git push -u origin main  
    cd ..
    done
    echo "loop complete"
    git add .
    git commit -m "$COMMIT"
    git push -u origin main
}

status(){
    git status  
}

delete(){
    echo "Enter the sub module directory; example use the / command"
    read text
    echo "Enter the commit"
    read COMMIT
    IFS='/'
    read -a strarr <<< "$text"
    echo ${#strarr[@]}

    if [[ ${#strarr[@]} -gt 1 ]]
    then
        for (( c=1; c<${#strarr[@]}; c++ ))
        do  
            cd ${strarr[c-1]}
        done

        git rm ${strarr[-1]}
        rm -rf .git/modules/${strarr[-1]}
        git config -f .git/config --remove-section submodule.${strarr[-1]} 2> /dev/null
        git add .
        git commit -m "$COMMIT"
        git push origin

        for (( c=1; c<${#strarr[@]}; c++ ))
        do  
            cd ..
            git add .
            git commit -m "$COMMIT"
            git push origin
        done

    else
        git rm $text
        rm -rf .git/modules/$text
        git config -f .git/config --remove-section submodule.$text 2> /dev/null
        git add .
        git commit -m "git remove submodule example complete"
        git push origin
    fi

}

while true
 do
 PS3='Please enter your selection: '
 options=("SubModule commit" "SubModule status" "SubModule remove" "Quit")
 select opt in "${options[@]}" 
 do
     case $opt in
         "SubModule commit")
             echo "you chose option 1"
             commit
             break
             ;;
         "SubModule status")
             echo "you chose option 2"
             status
             break
             ;;
         "SubModule remove")
             echo "you chose option 3"
             delete
             break
             ;;
         "Quit")
             echo "Thank You..."                 
             exit
             ;;
         *) echo invalid option;;
     esac
 done
 done