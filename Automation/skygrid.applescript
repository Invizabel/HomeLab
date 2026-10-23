tell application "System Events"
	
	set blocks to {"acacia_log", "acacia_planks", "bamboo_block", "birch_log", "calcite", "diamond_ore", "dripstone_block", "gold_ore", "grass_block", "moss_block", "iron_ore", "oak_log", "podzol", "purpur_block", "redstone_ore", "stone", "tuff"}
	set entities to {"acacia_button", "acacia_sapling"}

	-- Launch Minecraft to the front
	
	tell application "System Events"
		tell process "java"
			set frontmost to true
		end tell
	end tell
	
	delay 0.5
	
	-- Back out of the pause menu (escape)
	key code 53
	delay 0.5
	
	repeat with x from 0 to 75 by 5
		repeat with y from 0 to 75 by 5
			repeat with z from 0 to 75 by 5
				-- Open chat Enter == 36 OR T == 17
				key code 36
				delay 0.5
				
				-- Type the tp command
				set my_command to "/tp @s " & x & " " & y & " " & z
				keystroke my_command
				delay 0.5
				
				-- Execute the command
				key code 36 -- Return
				delay 0.5
				
				set is_chest to (random number from 0 to 9)
				
				if is_chest = 0 then
					-- Open chat Enter == 36 OR T == 17
					key code 36
					delay 0.5
					
					-- Type the set block command
					set my_command to "/setblock " & x & " " & y & " " & z & " minecraft:chest"
					keystroke my_command
					delay 0.5
					
					-- Execute the command
					key code 36 -- Return
					delay 0.5
					
					-- Open chat Enter == 36 OR T == 17
					key code 36
					delay 0.5

					-- Type the add to chest command
					set random_entity to some item of entities
					set my_command to "/item replace block " & x & " " & y & " " & z & " container.0 with minecraft:" & random_entity
					keystroke my_command
					delay 0.5
					
					-- Execute the command
					key code 36 -- Return
					delay 0.5
					
				else
					-- Open chat Enter == 36 OR T == 17
					key code 36
					delay 0.5
					
					-- Type the set block command
					set random_block to some item of blocks
					set my_command to "/setblock " & x & " " & y & " " & z & " minecraft:" & random_block
					keystroke my_command
					delay 0.5
					
					-- Execute the command
					key code 36 -- Return
					delay 0.5
				end if
			end repeat
		end repeat
	end repeat
	
	
	-- Return to AppleScript Editor
	tell application "Script Editor" to activate
end tell
