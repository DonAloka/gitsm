commit () {
    echo "Enter the sub module directory; example use the / command"
    read text
    echo "Enter the commit"
    read COMMIT

    STR1="default"    
    STR1=$text


    IFS='/'
    read -a strarr <<< "$text"
    echo ${#strarr[@]}    

    if [[ ${#strarr[@]} -gt 0 ]]
    then
        cd $STR1
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
        
    else
        
        git add .
        git commit -m $COMMIT
        git push -u origin main
    fi
 
}

status(){
    git status  
}

clone(){
    echo "Enter the main repository url"
    read clone_url
    git clone --recurse-submodule $clone_url
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

add(){
    echo "Enter the sub module directory; example use the / command"#change the capital simple
    read add_directory
    echo "Enter the remote url"
    read add_url

    STR2="default"    
    STR2=$add_directory

    a=($(echo $add_directory | tr '/' "\n"))  
 
    if [[ ${#a} -gt 0 ]]
    then        
        cd $STR2
        git submodule add $add_url
    else        
        git submodule add $add_url
    fi

    commit

  
}

while true
 do
 PS3='Please enter your selection: '
 options=("SubModule Repository clone" "SubModule add" "SubModule commit" "SubModule status" "SubModule remove" "Quit")
 select opt in "${options[@]}" 
 do
     case $opt in
        "SubModule Repository clone")
             echo "you chose option 1"
             clone
             break
             ;;
         "SubModule add")
             echo "you chose option 2"
             add
             break
             ;;
         "SubModule commit")
             echo "you chose option 3"
             commit
             break
             ;;
         "SubModule status")
             echo "you chose option 4"
             status
             break
             ;;
         "SubModule remove")
             echo "you chose option 5"
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
