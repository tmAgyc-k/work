#!/bin/bash

#Define list of tools to download/install
tools=(
	"gutterbox"
	"Evil-WinRm"
	"wifite2"
	"SharpUp"
	"Lockdoor-Framework"
	"Bloodhound"
	"CrackMapExec"
	"Impacket"
)

# Function to check if tools are already installed
is_tool_installed(){
	tool_name="$1"
		if [ -x "$(command -v $tool_name)" ]; then
			return 0 # Tool is installed
		else
			return 1 # Tool is not installed
		fi
}

# Define funciton to download/install tools
download(){
	tool_name="$1"
	echo "Downloading $tool_name..."
	# Actual command goes here \/
	git clone https://github.com/d4rkr41n/gutterbox.git
	git clone https://github.com/Hackplayers/evil-winrm.git
	git clone https://github.com/derv82/wifite2.git
	git clone https://github.com/GhostPack/SharpUp.git
	git clone https://github.com/SofianeHamlaoui/Lockdoor-Framework.git
	git clone https://github.com/BloodHoundAD/BloodHound.git
	git clone https://github.com/byt3bl33d3r/CrackMapExec.git
	git clone https://github.com/fortra/impacket.git
}


for tool in "${tools[@]}"; do
	if is_tool_installed "$tool"; then
		echo "$tool is already installed. Skipping... "
	else
		download "$tool"
	fi
done

echo "All tools downloaded successfully"
