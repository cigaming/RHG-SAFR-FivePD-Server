cmenu = {show = 0, row = 0, field = 1}
text_in = 0
draw = {0,0,0}
prop = {0,0,1}
model_id = 1
bar = {x=0.328, y=0.142, x1=0.037,y1=0.014}

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function startClothes()
	cmenu.show = 1
	cmenu.row = 1
	cmenu.field = 1
	text_in = 0
end

function ClothShop()
	HideHudAndRadarThisFrame()
	DrawRect(0.12,0.07,0.22,0.09,0,0,0,150) -- header
	drawTxt(0.177, 0.066, 0.25, 0.03, 0.40,"Cloth`n`Prop",255,255,255,255) -- header
	DrawRect(0.12,0.024,0.216,0.005,58,95,205,150) -- blue_head
	if cmenu.show == 1 then
		if cmenu.row == 1 then DrawRect(0.12,0.135,0.22,0.035,76,88,102,150) else DrawRect(0.12,0.135,0.22,0.035,0,0,0,150) end
		if cmenu.row == 2 then DrawRect(0.12,0.172,0.22,0.035,76,88,102,150) else DrawRect(0.12,0.172,0.22,0.035,0,0,0,150) end
		if cmenu.row == 3 then DrawRect(0.12,0.209,0.22,0.035,76,88,102,150) else DrawRect(0.12,0.209,0.22,0.035,0,0,0,150) end
		if cmenu.row == 4 then DrawRect(0.12,0.246,0.22,0.035,76,88,102,150) else DrawRect(0.12,0.246,0.22,0.035,0,0,0,150) end
		drawTxt(0.177, 0.128, 0.25, 0.03, 0.40,"Choose slot",255,255,255,255)
		drawTxt(0.177, 0.165, 0.25, 0.03, 0.40,"Accessories",255,255,255,255) -- row_2 (+0.037)
		drawTxt(0.177, 0.202, 0.25, 0.03, 0.40,"Player Model",255,255,255,255) -- row_2 (+0.037)
		drawTxt(0.177, 0.239, 0.25, 0.03, 0.40,"Exit",255,255,255,255) -- row_2 (+0.037)
	elseif cmenu.show == 2 then
		-- debug_you_can_delete_it
		local drawstr = string.format("Slot: %d~n~Draw: %d~n~Tex: %d~n~Pal: %d",cmenu.field-1, draw[1],draw[2],draw[3])
		drawTxt(0.28, 0.8, 0, 0, 0.40,drawstr,255,255,255,255)
		-- debug_end
		DrawRect(0.12,0.135,0.22,0.035,76,88,102,150)
		DrawRect(0.12,0.172,0.22,0.035,0,0,0,150)
		DrawRect(0.12,0.209,0.22,0.035,0,0,0,150)
		DrawRect(0.12,0.246,0.22,0.035,0,0,0,150)
		drawTxt(0.177, 0.128, 0.25, 0.03, 0.40,"~b~Choose slot",255,255,255,255)
		drawTxt(0.177, 0.165, 0.25, 0.03, 0.40,"Accessories",255,255,255,255) -- row_2 (+0.037)
		drawTxt(0.177, 0.202, 0.25, 0.03, 0.40,"Player Model",255,255,255,255) -- row_2 (+0.037)
		drawTxt(0.177, 0.239, 0.25, 0.03, 0.40,"Exit",255,255,255,255) -- row_2 (+0.037)
		---
		DrawRect(0.328,0.051,0.18,0.049,0,0,0,150) -- title
		drawTxt(0.382,0.048,0.175,0.035, 0.40,"Choose slot",255,255,255,255)
		DrawRect(0.328,0.024,0.175,0.005,58,95,205,150)
		if cmenu.row == 1 then DrawRect(0.328,0.096,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.096,0.18,0.035,0,0,0,150) end
		if cmenu.row == 2 then DrawRect(0.328,0.133,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.133,0.18,0.035,0,0,0,150) end
		if cmenu.row == 3 then DrawRect(0.328,0.170,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.170,0.18,0.035,0,0,0,150) end
		if cmenu.row == 4 then DrawRect(0.328,0.207,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.207,0.18,0.035,0,0,0,150) end
		--
		local draw_str = string.format("Slot: %d / 11", cmenu.field-1)
		drawTxt(0.328,0.093,0.175,0.035, 0.40,draw_str,255,255,255,255)
		--
		if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), cmenu.field-1) ~= 0 and GetNumberOfPedDrawableVariations(GetPlayerPed(-1), cmenu.field-1) ~= false then
			DrawRect(0.328,0.142,0.175,0.014,28,134,238,150)
			local link = 0.138/(GetNumberOfPedDrawableVariations(GetPlayerPed(-1), cmenu.field-1)-1)
			local new_x = (bar.x-0.069)+(link*draw[1])
			if new_x < 0.259 then new_x = 0.259 end
			if new_x > 0.397 then new_x = 0.397 end
			DrawRect(new_x,bar.y,bar.x1,bar.y1,0,0,238,150)
			-- row_3
			DrawRect(0.328,0.179,0.175,0.014,28,134,238,150) -- bar_main
			local link = 0.138/(GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmenu.field-1, draw[1])-1)
			local new_x = (bar.x-0.069)+(link*draw[2])
			if new_x < 0.259 then new_x = 0.259 end
			if new_x > 0.397 then new_x = 0.397 end
			DrawRect(new_x,bar.y+0.037,bar.x1,bar.y1,0,0,238,150)
			--
			DrawRect(0.328,0.216,0.175,0.014,28,134,238,150) 
			local link = 0.138/2
			local new_x = (bar.x-0.069)+(link*draw[3])
			if new_x < 0.259 then new_x = 0.259 end
			if new_x > 0.397 then new_x = 0.397 end
			DrawRect(new_x,bar.y+0.074,bar.x1,bar.y1,0,0,238,150) -- +2 rows
			--
			if IsControlJustPressed(1, 189) or IsDisabledControlJustPressed(1, 189) then -- left
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.row == 1 then
					if cmenu.field > 1 then 
						cmenu.field = cmenu.field-1
						draw[1] = 0
						draw[2] = 0
					else 
						cmenu.field = 12
						draw[1] = 0
						draw[2] = 0
					end
				elseif cmenu.row == 2 then
					if draw[1] > 0 then draw[1] = draw[1]-1 else draw[1] = 0 end
					draw[2] = 0
					SetPedComponentVariation(GetPlayerPed(-1), cmenu.field-1, draw[1], draw[2], draw[3])
				elseif cmenu.row == 3 then
					if draw[2] > 0 then draw[2] = draw[2]-1 else draw[2] = 0 end
					SetPedComponentVariation(GetPlayerPed(-1), cmenu.field-1, draw[1], draw[2], draw[3])
				elseif cmenu.row == 4 then
					if draw[3] > 0 then draw[3] = draw[3]-1 end
				end
			end
			if IsControlJustPressed(1, 190) or IsDisabledControlJustPressed(1, 190) then -- right
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.row == 1 then
					if cmenu.field < 12 then 
						cmenu.field = cmenu.field+1 
						draw[1] = 0
						draw[2] = 0
					else 
						cmenu.field = 1
						draw[1] = 0
						draw[2] = 0
					end
				elseif cmenu.row == 2 then
					if draw[1] < GetNumberOfPedDrawableVariations(GetPlayerPed(-1), cmenu.field-1)-1 then draw[1] = draw[1]+1 else draw[1] = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), cmenu.field-1)-1 end
					draw[2] = 0
					SetPedComponentVariation(GetPlayerPed(-1), cmenu.field-1, draw[1], draw[2], draw[3])
				elseif cmenu.row == 3 then
					if draw[2] < GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmenu.field-1, draw[1])-1 then draw[2] = draw[2]+1 else draw[2] = GetNumberOfPedTextureVariations(GetPlayerPed(-1), cmenu.field-1, draw[1])-1 end
					SetPedComponentVariation(GetPlayerPed(-1), cmenu.field-1, draw[1], draw[2], draw[3])
				elseif cmenu.row == 4 then
					if draw[3] < 2 then draw[3] = draw[3]+1 end
				end
			end
		else
			drawTxt(0.328,0.130,0.175,0.035, 0.40,"EMPTY SLOT",255,255,255,255)
			drawTxt(0.328,0.167,0.175,0.035, 0.40,"EMPTY SLOT",255,255,255,255)
			drawTxt(0.328,0.204,0.175,0.035, 0.40,"EMPTY SLOT",255,255,255,255)
			if IsControlJustPressed(1, 189) or IsDisabledControlJustPressed(1, 189) then -- left
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.field > 1 then 
					cmenu.field = cmenu.field-1
					draw[1] = 0
					draw[2] = 0
				else 
					cmenu.field = 12
					draw[1] = 0
					draw[2] = 0
				end
			end
			if IsControlJustPressed(1, 190) or IsDisabledControlJustPressed(1, 190) then -- right
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.field < 12 then 
					cmenu.field = cmenu.field+1
					draw[1] = 0
					draw[2] = 0
				else 
					cmenu.field = 1
					draw[1] = 0
					draw[2] = 0
				end
			end
		end
	elseif cmenu.show == 3 then
		-- debug_you_can_delete_it
		local drawstr = string.format("Slot: %d~n~Prop: %d~n~Var: %d",cmenu.field-1, prop[1],prop[2])
		drawTxt(0.28, 0.8, 0, 0, 0.40,drawstr,255,255,255,255)
		-- debug_end
		DrawRect(0.12,0.135,0.22,0.035,0,0,0,150)
		DrawRect(0.12,0.172,0.22,0.035,76,88,102,150)
		DrawRect(0.12,0.209,0.22,0.035,0,0,0,150)
		DrawRect(0.12,0.246,0.22,0.035,0,0,0,150)
		drawTxt(0.177, 0.128, 0.25, 0.03, 0.40,"Choose slot",255,255,255,255)
		drawTxt(0.177, 0.165, 0.25, 0.03, 0.40,"~b~Accessories",255,255,255,255) -- row_2 (+0.037)
		drawTxt(0.177, 0.202, 0.25, 0.03, 0.40,"Player Model",255,255,255,255) -- row_2 (+0.037)
		drawTxt(0.177, 0.239, 0.25, 0.03, 0.40,"Exit",255,255,255,255) -- row_2 (+0.037)
		---
		DrawRect(0.328,0.051,0.18,0.049,0,0,0,150) -- title
		drawTxt(0.382,0.048,0.175,0.035, 0.40,"Accessories",255,255,255,255)
		DrawRect(0.328,0.024,0.175,0.005,58,95,205,150)
		if cmenu.row == 1 then DrawRect(0.328,0.096,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.096,0.18,0.035,0,0,0,150) end
		if cmenu.row == 2 then DrawRect(0.328,0.133,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.133,0.18,0.035,0,0,0,150) end
		if cmenu.row == 3 then DrawRect(0.328,0.170,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.170,0.18,0.035,0,0,0,150) end
		local draw_str = string.format("Slot: %d / 7", cmenu.field-1)
		drawTxt(0.328,0.093,0.175,0.035, 0.40,draw_str,255,255,255,255)
		--
		if GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), cmenu.field-1) ~= 0 and GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), cmenu.field-1) ~= false then
			DrawRect(0.328,0.142,0.175,0.014,28,134,238,150)
			local link = 0.138/(GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), cmenu.field-1)-1)
			local new_x = (bar.x-0.069)+(link*prop[1])
			if new_x < 0.259 then new_x = 0.259 end
			if new_x > 0.397 then new_x = 0.397 end
			DrawRect(new_x,bar.y,bar.x1,bar.y1,0,0,238,150)
			-- row_3
			DrawRect(0.328,0.179,0.175,0.014,28,134,238,150) -- bar_main
			local link = 0.138/(GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmenu.field-1, prop[1])-1)
			local new_x = (bar.x-0.069)+(link*prop[2])
			if new_x < 0.259 then new_x = 0.259 end
			if new_x > 0.397 then new_x = 0.397 end
			DrawRect(new_x,bar.y+0.037,bar.x1,bar.y1,0,0,238,150)
			--
			if IsControlJustPressed(1, 189) or IsDisabledControlJustPressed(1, 189) then -- left
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.row == 1 then
					if cmenu.field > 1 then 
						cmenu.field = cmenu.field-1 
						prop[1] = 0
						prop[2] = 0
					else 
						cmenu.field = 8
						prop[1] = 0
						prop[2] = 0
					end
				elseif cmenu.row == 2 then
					if prop[1] > 0 then prop[1] = prop[1]-1 else prop[1] = 0 end
					prop[2] = 0
					SetPedPropIndex(GetPlayerPed(-1), cmenu.field-1, prop[1], prop[2], prop[3])
				elseif cmenu.row == 3 then
					if prop[2] > 0 then prop[2] = prop[2]-1 else prop[2] = 0 end
					SetPedPropIndex(GetPlayerPed(-1), cmenu.field-1, prop[1], prop[2], prop[3])
				end
			end
			if IsControlJustPressed(1, 190) or IsDisabledControlJustPressed(1, 190) then -- right
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.row == 1 then
					if cmenu.field < 8 then 
						cmenu.field = cmenu.field+1 
						prop[1] = 0
						prop[2] = 0
					else 
						cmenu.field = 1
						prop[1] = 0
						prop[2] = 0
					end
				elseif cmenu.row == 2 then
					if prop[1] < GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), cmenu.field-1)-1 then prop[1] = prop[1]+1 else prop[1] = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), cmenu.field-1)-1 end
					prop[2] = 0
					SetPedPropIndex(GetPlayerPed(-1), cmenu.field-1, prop[1], prop[2], prop[3])
				elseif cmenu.row == 3 then
					if prop[2] < GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmenu.field-1, prop[1])-1 then prop[2] = prop[2]+1 else prop[2] = GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), cmenu.field-1, prop[1])-1 end
					SetPedPropIndex(GetPlayerPed(-1), cmenu.field-1, prop[1], prop[2], prop[3])
				end
			end
		else
			drawTxt(0.328,0.130,0.175,0.035, 0.40,"EMPTY SLOT",255,255,255,255)
			drawTxt(0.328,0.167,0.175,0.035, 0.40,"EMPTY SLOT",255,255,255,255)
			if IsControlJustPressed(1, 189) or IsDisabledControlJustPressed(1, 189) then -- left
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.field > 1 then 
					cmenu.field = cmenu.field-1
					prop[1] = 0
					prop[2] = 0
				else 
					cmenu.field = 8
					prop[1] = 0
					prop[2] = 0
				end
			end
			if IsControlJustPressed(1, 190) or IsDisabledControlJustPressed(1, 190) then -- right
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.field < 8 then 
					cmenu.field = cmenu.field+1
					prop[1] = 0
					prop[2] = 0
				else 
					cmenu.field = 1
					prop[1] = 0
					prop[2] = 0
				end
			end
		end
	elseif cmenu.show == 4 then
		local drawstr = string.format("ID: %d~n~Name: %s",model_id, fr_skins[model_id])
		drawTxt(0.28, 0.8, 0, 0, 0.40,drawstr,255,255,255,255)
		DrawRect(0.12,0.135,0.22,0.035,0,0,0,150)
		DrawRect(0.12,0.172,0.22,0.035,0,0,0,150)
		DrawRect(0.12,0.209,0.22,0.035,76,88,102,150)
		DrawRect(0.12,0.246,0.22,0.035,0,0,0,150)
		drawTxt(0.177, 0.128, 0.25, 0.03, 0.40,"Choose slot",255,255,255,255)
		drawTxt(0.177, 0.165, 0.25, 0.03, 0.40,"Accessories",255,255,255,255)
		drawTxt(0.177, 0.202, 0.25, 0.03, 0.40,"~b~Player Model",255,255,255,255)
		drawTxt(0.177, 0.239, 0.25, 0.03, 0.40,"Exit",255,255,255,255)
		DrawRect(0.328,0.051,0.18,0.049,0,0,0,150)
		drawTxt(0.382,0.048,0.175,0.035, 0.40,"Player Model",255,255,255,255)
		DrawRect(0.328,0.024,0.175,0.005,58,95,205,150)
		if cmenu.row == 1 then DrawRect(0.328,0.096,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.096,0.18,0.035,0,0,0,150) end
		if cmenu.row == 2 then DrawRect(0.328,0.133,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.133,0.18,0.035,0,0,0,150) end
		if cmenu.row == 3 then DrawRect(0.328,0.170,0.18,0.035,76,88,102,150) else DrawRect(0.328,0.170,0.18,0.035,0,0,0,150) end
		local draw_str = string.format("Slot: < %d / 690 >", model_id)
		drawTxt(0.328,0.093,0.175,0.035, 0.40,draw_str,255,255,255,255)
		draw_str = string.format("%s", fr_skins[model_id])
		drawTxt(0.328,0.093+0.037,0.175,0.035, 0.40,draw_str,255,255,255,255)
		drawTxt(0.328,0.093+0.037*2,0.175,0.035, 0.40,"Exact Skin",255,255,255,255)
		if IsControlJustPressed(1, 189) or IsDisabledControlJustPressed(1, 189) then -- left
			if cmenu.row == 1 then
				if model_id > 1 then
					model_id=model_id-1
				else
					model_id = 690
				end
			end
		end
		if IsControlJustPressed(1, 190) or IsDisabledControlJustPressed(1, 190) then -- right
			if cmenu.row == 1 then
				if model_id < 690 then
					model_id=model_id+1
				else
					model_id = 1
				end
			end
		end
		if IsControlJustPressed(1, 201) or IsDisabledControlJustPressed(1, 201) then -- Enter
			if cmenu.row == 1 or cmenu.row == 2 then
				ChangeToSkin(fr_skins[model_id])
			elseif cmenu.row == 3 then
				if text_in == 0 then
					text_in = 1
					DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 64)
				end
			end
		end
	end
end

function ShowRadarMessage(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

function ChangeToSkin(skin)
	local model = GetHashKey(skin)
	if IsModelInCdimage(model) and IsModelValid(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
		SetPedRandomComponentVariation(GetPlayerPed(-1), true)
		ShowRadarMessage('New skin is: '..skin)
		SetModelAsNoLongerNeeded(model)
	else
		ShowRadarMessage("Model is not founded")
	end
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustPressed(2, 214) and GetLastInputMethod(2) then -- delete
			if cmenu.show == 0 then
				PlaySound(-1, "FocusIn", "HintCamSounds", 0, 0, 1)
				startClothes()
			end
		end
		if cmenu.show == 1 then
			ClothShop()
			if IsControlJustPressed(1, 188) or IsDisabledControlJustPressed(1, 188) then -- up
				if cmenu.row > 1 then cmenu.row = cmenu.row-1 else cmenu.row = 4 end
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			elseif IsControlJustPressed(1, 187) or IsDisabledControlJustPressed(1, 187) then -- down
				if cmenu.row < 4 then cmenu.row = cmenu.row+1 else cmenu.row = 1 end
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			elseif IsControlJustPressed(1, 201) or IsDisabledControlJustPressed(1, 201) then -- Enter
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				if cmenu.row == 1 then
					cmenu.show = 2
					cmenu.row = 1
				elseif cmenu.row == 2 then
					cmenu.show = 3
					cmenu.row = 1
				elseif cmenu.row == 3 then
					cmenu.show = 4
					cmenu.row = 1
				elseif cmenu.row == 4 then
					cmenu.show = 0
					cmenu.row = 0
					cmenu.field = 0
				end
			end
		elseif cmenu.show == 2 then
			ClothShop()
			if IsControlJustPressed(1, 188) or IsDisabledControlJustPressed(1, 188) then -- up
				if cmenu.row > 1 then cmenu.row = cmenu.row-1 else cmenu.row = 4 end
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			elseif IsControlJustPressed(1, 187) or IsDisabledControlJustPressed(1, 187) then -- down
				if cmenu.row < 4 then cmenu.row = cmenu.row+1 else cmenu.row = 1 end
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			elseif IsControlJustPressed(1, 202) or IsDisabledControlJustPressed(1, 202) then -- backspase
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				cmenu.show = 1
				cmenu.row = 1
				cmenu.field = 1
			end
		elseif cmenu.show == 3 then
			ClothShop()
			if IsControlJustPressed(1, 188) or IsDisabledControlJustPressed(1, 188) then -- up
				if cmenu.row > 1 then cmenu.row = cmenu.row-1 else cmenu.row = 3 end
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			elseif IsControlJustPressed(1, 187) or IsDisabledControlJustPressed(1, 187) then -- down
				if cmenu.row < 3 then cmenu.row = cmenu.row+1 else cmenu.row = 1 end
				PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			elseif IsControlJustPressed(1, 202) or IsDisabledControlJustPressed(1, 202) then -- backspase
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				cmenu.show = 1
				cmenu.row = 2
				cmenu.field = 1
			end
		elseif cmenu.show == 4 then
			if text_in == 1 then
				HideHudAndRadarThisFrame()
				if UpdateOnscreenKeyboard() == 3 then text_in = 0
				elseif UpdateOnscreenKeyboard() == 1 then 
					text_in = 0
					ChangeToSkin(GetOnscreenKeyboardResult())
				elseif UpdateOnscreenKeyboard() == 2 then text_in = 0 end
			else
				ClothShop()
				if IsControlJustPressed(1, 188) or IsDisabledControlJustPressed(1, 188) then -- up
					if cmenu.row > 1 then cmenu.row = cmenu.row-1 else cmenu.row = 3 end
					PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				elseif IsControlJustPressed(1, 187) or IsDisabledControlJustPressed(1, 187) then -- down
					if cmenu.row < 3 then cmenu.row = cmenu.row+1 else cmenu.row = 1 end
					PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				elseif IsControlJustPressed(1, 202) or IsDisabledControlJustPressed(1, 202) then -- backspase
					PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					cmenu.show = 1
					cmenu.row = 3
					cmenu.field = 1
				end
			end
		end
	end
end)