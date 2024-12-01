#!/bin/bash

log_file="wizard_adventure_log.txt"
whiptail_installed=false

# Function to log messages
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" | tee -a "$log_file"
}

# Function to show a message box with error handling
show_message() {
    if ! whiptail --msgbox "$1" 10 60; then
        log "Error displaying message: $1"
    fi
}

# Function to show a menu and return the selected option with error handling
show_menu() {
    OPTION=$(whiptail --title "$1" --menu "$2" 15 60 4 "$3" "$4" "$5" "$6" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        log "Error displaying menu: $1"
        OPTION=""
    fi
    echo $OPTION
}

# Install whiptail if not already installed
log "🌪 Checking for whiptail... 🌪"
if ! command -v whiptail &> /dev/null; then
    log "🌪 whiptail not found. Installing whiptail... 🌪"
    if ! sudo apt update && sudo apt install -y whiptail; then
        log "🌪 Failed to install whiptail. 🌪"
        exit 1
    else
        log "🌪 whiptail installed. 🌪"
        whiptail_installed=true
    fi
else
    log "🌪 whiptail is already installed. 🌪"
fi

# Start of the game
log "🌈 Starting Wizard of Oz Adventure... 🌈"
show_message "🌈 Welcome to the Wizard of Oz Adventure! 🌈"

# Prologue
log "🌪 A tornado has whisked you away to the Land of Oz. 🌪"
show_message "🌪 You find yourself in a strange land after a tornado. 🌪"

# Meeting the Munchkins
log "🍭 You meet the Munchkins and the Good Witch of the North. 🍭"
show_message "🍭 The Munchkins and the Good Witch of the North greet you. 🍭"

choice1=$(show_menu "The Munchkins" "What do you do?" \
"1" "Ask for help to return home" "2" "Explore the area")

case $choice1 in
    1)
        log "🍭 You ask the Munchkins for help to return home. 🍭"
        show_message "🍭 The Good Witch advises you to go to the Emerald City and meet the Wizard of Oz. 🍭"
        ;;
    2)
        log "🍭 You decide to explore the area. 🍭"
        show_message "🍭 You wander through Munchkinland and find strange and wonderful sights. 🍭"
        ;;
    *)
        log "🍭 Invalid choice in Munchkinland. Defaulting to asking for help. 🍭"
        show_message "🍭 The Good Witch advises you to go to the Emerald City and meet the Wizard of Oz. 🍭"
        ;;
esac

# The Yellow Brick Road
log "🟨 You start your journey on the Yellow Brick Road. 🟨"
show_message "🟨 You begin your journey on the Yellow Brick Road to the Emerald City. 🟨"

# Meeting the Scarecrow
log "🌾 You meet the Scarecrow who wishes for a brain. 🌾"
show_message "🌾 You meet the Scarecrow who wishes for a brain. 🌾"
choice2=$(show_menu "The Scarecrow" "What do you do?" \
"1" "Invite the Scarecrow to join you" "2" "Continue alone")

case $choice2 in
    1)
        log "🌾 You invite the Scarecrow to join you. 🌾"
        show_message "🌾 The Scarecrow happily joins you on your journey. 🌾"
        ;;
    2)
        log "🌾 You decide to continue alone. 🌾"
        show_message "🌾 You leave the Scarecrow behind and continue your journey. 🌾"
        ;;
    *)
        log "🌾 Invalid choice with the Scarecrow. Defaulting to inviting him. 🌾"
        show_message "🌾 The Scarecrow happily joins you on your journey. 🌾"
        ;;
esac

# Meeting the Tin Woodman
log "🪓 You meet the Tin Woodman who wishes for a heart. 🪓"
show_message "🪓 You meet the Tin Woodman who wishes for a heart. 🪓"
choice3=$(show_menu "The Tin Woodman" "What do you do?" \
"1" "Invite the Tin Woodman to join you" "2" "Continue alone")

case $choice3 in
    1)
        log "🪓 You invite the Tin Woodman to join you. 🪓"
        show_message "🪓 The Tin Woodman gladly joins you on your journey. 🪓"
        ;;
    2)
        log "🪓 You decide to continue alone. 🪓"
        show_message "🪓 You leave the Tin Woodman behind and continue your journey. 🪓"
        ;;
    *)
        log "🪓 Invalid choice with the Tin Woodman. Defaulting to inviting him. 🪓"
        show_message "🪓 The Tin Woodman gladly joins you on your journey. 🪓"
        ;;
esac

# Meeting the Cowardly Lion
log "🦁 You meet the Cowardly Lion who wishes for courage. 🦁"
show_message "🦁 You meet the Cowardly Lion who wishes for courage. 🦁"
choice4=$(show_menu "The Cowardly Lion" "What do you do?" \
"1" "Invite the Cowardly Lion to join you" "2" "Continue alone")

case $choice4 in
    1)
        log "🦁 You invite the Cowardly Lion to join you. 🦁"
        show_message "🦁 The Cowardly Lion joins you, though he is still very afraid. 🦁"
        ;;
    2)
        log "🦁 You decide to continue alone. 🦁"
        show_message "🦁 You leave the Cowardly Lion behind and continue your journey. 🦁"
        ;;
    *)
        log "🦁 Invalid choice with the Cowardly Lion. Defaulting to inviting him. 🦁"
        show_message "🦁 The Cowardly Lion joins you, though he is still very afraid. 🦁"
        ;;
esac

# Reaching the Emerald City
log "🏙 You finally reach the Emerald City. 🏙"
show_message "🏙 You finally reach the Emerald City. 🏙"

# Meeting the Wizard
log "🎩 You meet the Wizard of Oz who agrees to help if you defeat the Wicked Witch of the West. 🎩"
show_message "🎩 The Wizard agrees to help if you defeat the Wicked Witch of the West. 🎩"
choice5=$(show_menu "The Wizard's Task" "What do you do?" \
"1" "Agree to the task" "2" "Refuse the task")

case $choice5 in
    1)
        log "🎩 You agree to the task. 🎩"
        show_message "🎩 You embark on a mission to defeat the Wicked Witch of the West. 🎩"
        ;;
    2)
        log "🎩 You refuse the task. 🎩"
        show_message "🎩 The Wizard refuses to help you until you defeat the Wicked Witch of the West. 🎩"
        ;;
    *)
        log "🎩 Invalid choice with the Wizard. Defaulting to agreeing to the task. 🎩"
        show_message "🎩 You embark on a mission to defeat the Wicked Witch of the West. 🎩"
        ;;
esac

# The Wicked Witch's Castle
log "🧙‍♀️ You reach the Wicked Witch's Castle. 🧙‍♀️"
show_message "🧙‍♀️ You reach the Wicked Witch's Castle. 🧙‍♀️"
choice6=$(show_menu "The Wicked Witch" "How do you approach the castle?" \
"1" "Stealthily sneak in" "2" "Launch a direct attack")

case $choice6 in
    1)
        log "🧙‍♀️ You sneak into the castle. 🧙‍♀️"
        show_message "🧙‍♀️ You sneak into the castle and find the Wicked Witch's lair. 🧙‍♀️"
        ;;
    2)
        log "🧙‍♀️ You launch a direct attack. 🧙‍♀️"
        show_message "🧙‍♀️ You storm the castle with your companions. 🧙‍♀️"
        ;;
    *)
        log "🧙‍♀️ Invalid choice at the castle. Defaulting to sneaking in. 🧙‍♀️"
        show_message "🧙‍♀️ You sneak into the castle and find the Wicked Witch's lair. 🧙‍♀️"
        ;;
esac

# Defeating the Wicked Witch
log "🌊 You find and confront the Wicked Witch of the West. 🌊"
show_message "🌊 You find the Wicked Witch of the West in her