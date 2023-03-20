initial_checks() {
  if ! [ -x "$(command -v hashcat)" ]; then
    echo 'Error: Hashcat is not installed. Attempting to installing now..' >&2
    sudo apt install hashcat
  fi

  if ! [ -x "$(command -v zenity)" ]; then
    echo 'Error: Zenity is not installed. Attempting to installing now..' >&2
    sudo apt install zenity
  fi

  if [ -s $MAIN_DIR/stored_hash/hash_value.txt ]; then
    # The file is not-empty.
    hash_type=$(cat $MAIN_DIR/stored_hash/hash_type.txt)
    hash_status=$(ColorLightGreen 'SET!')
  else
    # The file is empty.
    hash_status=$(ColorRed 'NOT SET')
  fi

  if [ -s $(dirname "$0")/stored_hash/hash_type.txt ]; then
  	if grep -wq "900" "$MAIN_DIR/stored_hash/hash_type.txt"; then
  		hash_type_name="MD4"
		fi

		if grep -wq "0" "$MAIN_DIR/stored_hash/hash_type.txt"; then
	  		hash_type_name="MD5"
		fi

		if grep -wq "10" "$MAIN_DIR/stored_hash/hash_type.txt"; then
	  		hash_type_name=("MD5--Password:Salt")
		fi

		if grep -wq "20" "$MAIN_DIR/stored_hash/hash_type.txt"; then
	  		hash_type_name=("MD5--Salt:Password")
		fi

		if grep -wq "100" "$MAIN_DIR/stored_hash/hash_type.txt"; then
	  		hash_type_name="SHA1"
		fi

		if grep -wq "1400" "$MAIN_DIR/stored_hash/hash_type.txt"; then
	  		hash_type_name="SHA2-256"
		fi

		if grep -wq "1700" "$MAIN_DIR/stored_hash/hash_type.txt"; then
	  		hash_type_name="SHA2-512"
		fi

		hash_type_status=$(ColorLightGreen $hash_type_name)
  else
  	hash_type_status=$(ColorRed 'NOT SET')
  fi

}