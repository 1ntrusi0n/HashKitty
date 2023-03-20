attack_type_tutorial(){
  clear
  echo -ne "
  $(ColorLightRed '##########################################')
  $(ColorLightRed '########## Attack Type Tutorial ##########')
  $(ColorLightRed '##########################################')

  $(ColorWhite '-----------------How does password cracking work exactly?-----------------')

  When passwords are saved in a database, they are normally 'hashed' first. Hashing means using some
  function or mathematical algorithm to map object data to some representative value. Simply put, that
  means passwords are converted to an series of numbers, letters, and sometimes special characters.
  After they are hashed, they are stored in the database in the hopes of remaining secret if an attacker
  gains access to said database. Various encryption methods hash differently.  For my examples, I'll be
  using MD5. It's considered the most common hashing method.  However, if you are using encryption, please
  do not use MD5. The cipher itself was broken years ago and is not considered secure for passwords.

  In the following example, we'll use the password 'iloveyou'.  After the phrase is hashed in MD5,
  it becomes 'f25a2fc72690b780b2a14e140ef6a9e0'. It will always be the same series of 32 alpha-numerical
  letters and numbers. That being said, if anything about 'iloveyou' changes, the entire hash changes.
  For instance, if we capitalize the 'i' in 'Iloveyou', the hash then becomes '0b3364569955a095cd07ba6bad26091d'.

  At its most basic level, password-cracking software guesses a password by using either a dictionary file,
  or running through a series of letters, numbers, and special characters. The software then hashes it, and
  then compares the resulting hash to the one it's trying to crack. If the hashes match, we have the password.
  If not, keep guessing. The speed at which this happens is based on the performance capabilities of the computer
  it's being run on. What could take hours on a low-end computer, could take only minutes or less on a high-end
  system.

  Now that you have a basic understanding of how hashing and password cracking works, let's take a look at
  the various types of attacks we can use on a hash, or list of hashes.


  $(ColorLightBlue '##########################################')
  $(ColorLightBlue '############ Dictionary Attack ###########')
  $(ColorLightBlue '##########################################')
  A dictionary attack uses a 'dictionary file' (which is normally just a simple text file) full of known
  passwords to attempt to crack a password hash value. Dictionary files are read line-by-line by cracking
  software, so each password is on a separate line. Dictionary files can be anywhere from a few passwords,
  to several gigabytes in size, or more. Remember that the larger your dictionary file is, the longer the
  software has to run. Generally speaking, this is the most common method of attack, as it's simple and
  effective against weak passwords. It's also pretty fast, since the computer is not having to generate
  random information AND hash it.


  $(ColorLightBlue '##########################################')
  $(ColorLightBlue '########### Brute-Force Attack ###########')
  $(ColorLightBlue '##########################################')
  A brute-force attack is the most thorough attack-type.  It's also by far the slowest. When a brute-force
  attack is used, the computer generates every possible combination of characters in sequence. For example,
  it will try the entire alphabet both lowercase and uppercase (a,b,c,d,A,B,C,D), then 0-9, then special
  characters like !, @, #, etc. After exhausting the possibilities, it then adds another character and does
  the same thing again, except this time to both of them (aa,ab,ac,ad, etc). As you can probably imagine,
  the greater the number of characters, the longer it takes. This also depends on how complex the password
  is.  For example, a 10-digit password can be cracked almost instantly, whereas a good password with lowercase
  letters, uppercase letters, numbers, and special characters of the same length could take months or years.
  Again, there's several variables at play that can raise or lower that based on a computers performance.


  $(ColorLightBlue '##########################################')
  $(ColorLightBlue '############### Mask Attack ##############')
  $(ColorLightBlue '##########################################')
  A mask attack uses placeholder values that can be specified by the attacker. Let's say we KNOW the suspect
  uses an 8-character password, and we know they don't use special characters. We can tell our software to try a
  series of letters followed by numbers.  For example, L,L,L,L,L,D,D,D. L representing a letter, and D representing a
  digit. Consider it a refined brute-force attack. It's effective, and it cuts the time needed to crack the password
  to a fraction of what a general brute-force attack would take. Instead of just using one mask, you can use a
  number of different masks in a text file that the software will go through line-by-line. These attacks are extremely
  effective, as the mask sets are normally comprised by experienced password-crackers that know what the most popular
  password structure types are, based on what they've seen and experienced in the wild.

    $(ColorWhite 'EXAMPLE:') $(ColorLightRed '?l?l?l?d?d?d, ?u?u?u?d?d?d') - This example shows first trying letters a-z (l) and digits 0-9 (d), and the second example 
    uses capital letters A-Z (u) with digits 0-9 (d).


  $(ColorLightBlue '##########################################')
  $(ColorLightBlue '############## Hybrid Attack #############')
  $(ColorLightBlue '##########################################')
  A hybrid attack uses a combination of a dictionary attack, and a mask attack. For instance, let's say in your dictionary
  file, your first password is 'iloveyou'. A hybrid attack adds a variable at the beginning or end of the word. This can
  be specified as any character type, OR ALL character possibilities. This means the software will start with 'iloveyou1',
  and end with a special character like 'iloveyou+'. In a hybrid attack, multiple variables can be added before or after
  your dictionary words. I will illustrate this structure using ?a as the variable. ?a in hashcat means 'all characters'.

    $(ColorWhite 'EXAMPLE:') $(ColorLightRed 'iloveyou?a?a?a?a?a') - This will try the word 'iloveyou' with every possible character combination 5 times.
    Obviously the more masks you add, the longer this will take to perform.


  $(ColorLightBlue '##########################################')
  $(ColorLightBlue '############ Rule-Based Attack ###########')
  $(ColorLightBlue '##########################################')
  A rule-based attack uses something called a 'rule' file to perform a series of attacks. Think of a rule-based
  attack as a dictionary attack on steroids. A rule-based attack takes the words within a dictionary file, and
  attempts several variation possibilities of the words in it. For example, let's say our dictionary word is
  'iloveyou'. A rule-based attack will try things like, 'ILoveYou', 'ILOVEYOU', 'i10v3y0u', etc. This type of attack
  is effective against a password that is common, but someone has tried to obfuscate it by placing zeros instead of
  o's, and so forth.

    $(ColorWhite 'EXAMPLE:') $(ColorLightRed 'iloveyou, ILOVEYOU, 1l0v3y0u') - A rule-based attack will take a word from your dictionary file and manipulate
    it into several possibilities to try as part of the attack.


  $(ColorLightBlue '##########################################')
  $(ColorLightBlue '############ Combinator Attack ###########')
  $(ColorLightBlue '##########################################')
  A combinator attack takes two dictionary files, and concatenates (or joins) them together to perform an
  attack that uses words from both lists in varying series. This type of attack can be particularly useful
  against passwords that are exceptionally long, since many times it's joining two or more words together.
  Depending on the size of the dictionary files, the performance of the computer, and the type of hash,
  this attack can take quite some time.

    $(ColorWhite 'EXAMPLE:') $(ColorLightRed 'dictionary1.txt') + $(ColorLightRed 'dictionary2.txt') - This type of attack takes words from one list, and 
    combines them with words of a different list.


  $(ColorRed 'Press ENTER to return to the main menu..')
  "
  read
  main_menu
}
