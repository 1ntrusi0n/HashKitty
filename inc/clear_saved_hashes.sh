clear_saved_hashes(){
  if [ -s $(dirname "$0")/stored_hash/hash_value.txt ]; then
          # The file is not-empty.
          clear
          truncate -s 0 $(dirname "$0")/stored_hash/hash_value.txt
          echo ""
          echo "Detected hash has been cleared."
          echo ""
          echo $(ColorRed 'Returning to the main menu..')
          sleep 1.5
          main_menu
  else
          # The file is empty.
          clear
          echo ""
          echo $(ColorRed 'There are no hashes to clear!')
          echo ""
          hour=0
          min=0
          sec=3
                 while [ $hour -ge 0 ]; do
                          while [ $min -ge 0 ]; do
                                  while [ $sec -ge 0 ]; do
                                          echo -ne "Returning to main menu in...$sec\033[0K\r"
                                          let "sec=sec-1"
                                          sleep 1
                                  done
                                  sec=59
                                  let "min=min-1"
                          done
                          min=59
                          let "hour=hour-1"
                  done
  fi
  clear
  main_menu
}