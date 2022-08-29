#!/bin/zsh

echo "Please make sure you're currently set as a sudo user or you won't be able to install some of the tools!"
echo "Please press enter after setting sudo user."

while [ true ] ; do
  read -t 45 -n 1
  if [ $? = 0 ] ; then
    echo "Which tools do you wish to install?"
    echo "1 - Development tools (Jetbrain apps, git-crypt, node, etc.)."
    echo "2 - General tools (Chrome, CloudFoundry CLI, Slack, etc.)."
    echo "3 - All of the above."
    echo "4 - Exit."
    echo -n "-> "
    read Response

    case $Response in
      1* )
        echo "Installing Development Tools..."

        cd development_tools/
        ./install.sh > /dev/null

        echo "Installation finished! Please check any shown errors."

        exit;;
      2* )
        echo "Installing General Tools..."

        cd general_tools/.dotfiles/
        ./install.sh > /dev/null

        echo "Installation finished! Please check any shown errors."

        exit;;
      3* )
        echo "Installing all tools, starting with Development Tools..."
        cd development_tools/
        ./install.sh > /dev/null

        echo "Development Tools installed, moving on to General Tools..."
        cd ..
        cd general_tools/.dotfiles/
        ./install.sh > /dev/null

        echo "Installation finished! Please check any shown errors."

        exit;;
      4* )
        echo "Stopping installation..."
        exit;;

      * )   echo "Please pick a valid option.";

  esac
  else
  echo "Waiting for keypress..."
  fi
done
