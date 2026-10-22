-- Each delay is 5 seconds due to weird stuff happening in Minecraft if this script goes too fast

tell application "System Events"
	
	set blocks to {"bamboo_block", "burch_log", "diamond_ore", "gold_ore", "grass_block", "moss_block", "iron_ore", "oak_log", "purpur_block", "redstone_ore", "stone"}
	
	-- Launch Minecraft to the front
	tell application "System Events"
		tell process "java"
			set frontmost to true
		end tell
	end tell
	
	delay 5
	
	-- Back out of the pause menu (escape)
	key code 53
	delay 5
	
	repeat with x from 0 to 95 by 5
		repeat with y from 0 to 95 by 5
			repeat with z from 0 to 95 by 5
				set random_block to some item of blocks
				
				-- Open chat Enter == 36 OR T == 17
				key code 36
				delay 5
				
				-- Type the tp command
				set my_command to "/tp @s " & x & " " & y & " " & z
				keystroke my_command
				delay 5
				
				-- Execute the command
				key code 36 -- Return
				delay 5
				
				set is_chest to (random number from 0 to 99)
				
				if is_chest = 0 then
					
					-- Open chat Enter == 36 OR T == 17
					key code 36
					delay 5
					
					-- Type the set block command
					set my_command to "/setblock " & x & " " & y & " " & z & " minecraft:chest"
					keystroke my_command
					delay 5
					
					-- Execute the command
					key code 36 -- Return
					delay 5
					
					-- Open chat Enter == 36 OR T == 17
					key code 36
					delay 5
					
					-- Type the set block command
					set my_command to "/item replace block " & x & " " & y & " " & z & " container.0 with minecraft:water_bucket"
					keystroke my_command
					delay 5
					
					-- Execute the command
					key code 36 -- Return
					delay 5
					
				else
					
					-- Open chat Enter == 36 OR T == 17
					key code 36
					delay 5
					
					-- Type the set block command
					set my_command to "/setblock " & x & " " & y & " " & z & " minecraft:" & random_block
					keystroke my_command
					delay 5
				end if
				
				-- Execute the command
				key code 36 -- Return
				delay 5
			end repeat
		end repeat
	end repeat
	
	
	-- Return to AppleScript Editor
	tell application "Script Editor" to activate
end tell