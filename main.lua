
io.write("Do you want to update your system? y/n: ") --System update prompt
userinput = io.read()
if userinput == "y" then
	os.execute("sudo apt update")
else print("you said no")
end


io.write("Do you want fix your kali repo's? y/n: ")--Kali repo update prompt
userinput = io.read()
if userinput == "y" then
	os.execute("echo \"deb http://http.kali.org/kali kali-last-snapshot main contrib non-free\" | sudo tee /etc/apt/sources.list")
else print("you said no")
end

io.write("Do you want to install FirmAE? y/n: ")--Kali repo update prompt
userinput = io.read()
if userinput == "y" then
	os.execute("git clone --recursive https://github.com/pr0v3rbs/FirmAE\" | sudo tee /etc/apt/sources.list")
	--os.execute("cd FirmAE")
	--os.execute("./download.sh")
	--os.execute("./install.sh")
else print("you said no")
end





