import time
import os
import sys
import subprocess

##Red: \033[91m
#Green: \033[92m
#Yellow: \033[93m
#Blue: \033[94m
#Magenta: \033[95m
#Cyan: \033[96m
#White: \033[97m
#Reset: \033[0m

#slow print function
def sprint(str):
   for c in str +  '\n':
     sys.stdout.write(c)
     sys.stdout.flush()
     time.sleep(5./90)  

#system clear 
def clear_screen():
    os.system("cls||clear")

#main menu
def main_menu():
    while True:
        try:
            clear_screen()
            os.system("chmod +x *")
            print("\n\n")
            print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-----{ CYB3R KING}---->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            print("\033[92m[\033[91m1\033[92m] \033[93mKALI LINUX  \n\033[92m[\033[91m2\033[92m] \033[93mKALI LINUX VNC \n\033[92m[\033[91m3\033[92m] \033[93mWINDOWS 10\n\033[92m[\033[91m4\033[92m] \033[93mUBUNTU\n\033[92m[\033[91m5\033[92m]\033[93m WINE \n\033[92m[\033[91m6\033[92m] \033[93mDEBIAN VNC \n\033[92m[\033[91m7\033[92m] \033[93mDEBIAN WEB\n\033[92m[\033[91m8\033[92m] \033[93mMATE\n\033[92m[\033[91m9\033[92m] \033[93mXFCE4 \n\033[92m[\033[91m0\033[92m] \033[93mBack")
            print("\n")
            choice = int(input("\033[94mChoose your option: \033[95m"))
#\033[92m[\033[91m1\033[92m] \033[93m
            if choice == 1:
                clear_screen()
                print ("\n\n")
                sprint ("\t\033[96mLunching Kali Linux .....")
                time.sleep(2)
                os.system("bash os/docker/kali.sh")                
            elif choice == 2:
                clear_screen()
                print ("\n\n")
                sprint ("\t\033[96mLunching Kali Linux ( vnc ).....")
                time.sleep(2)
                os.system("bash os/docker/kalivnc.sh") 
            elif choice == 3:
                clear_screen()
                print ("\n\n")
                sprint ("\t\033[96mLunching Windows 10....")
                time.sleep(2)
                os.system("bash os/docker/win10.sh") 
            elif choice == 4:
                clear_screen()
                print ("\n\n")
                sprint ("\t\033[96mLunching UBUNTU...... ")
                time.sleep(2)
                os.system("bash os/docker/Ubuntu.sh") 
            elif choice == 5:
                clear_screen()
                print ("\n\n")
                sprint ("\t\033[96mLunching WINE.....")
                time.sleep(2)
                os.system("bash os/docker/wine.sh") 
            elif choice == 6:
                clear_screen()
                print ("\n\n")
                sprint ("\t\033[96mLunching  Debian vnc.....")
                time.sleep(2)
                os.system("bash os/docker/debianvnc.sh") 
            elif choice == 7:
                clear_screen()
                print ("\n\n")
                sprint ("\t\033[96mLunching Debian (web)......")
                time.sleep(2)
                os.system("bash os/docker/debianweb.sh") 
            elif choice == 8:
                clear_screen()
                print ("\n\n")
                time.sleep(2)
                print("\tLunching MATE.....")                
                os.system("bash os/docker/mate.sh") 
            elif choice == 9:
                clear_screen()
                print ("\n\n")
                sprint ("\t\033[96mLunching XFCE4.......")
                time.sleep(2)
                os.system("bash os/docker/xfce4.sh") 
            elif choice == 0:
                clear_screen()
                sys.exit(0)
            else:
                print("Invalid option. Please enter 1, 2, 3, 4, 5, 6, 7, 8 or 0.")
        except ValueError:
            print("")

clear_screen()

if __name__ == "__main__":
    main_menu()
