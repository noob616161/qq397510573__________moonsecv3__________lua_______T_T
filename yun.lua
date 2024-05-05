
Important_Whitelist = ([[

R.EN Revision [ April 04, 2024 ]

R.EN Release 2.0 
Copyright (c) 2024 by Mr 123fa98.
Writen by Mr 123fa98

]])


local whitelist = loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/wait.lua"))();

local api = game:HttpGet("https://users.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId)
local REN_name = string.match(api,'name":"(.-)",')
local REN_displayName = string.match(api,'displayName":"(.-)"')

if game.Players.LocalPlayer.Name == game.Players.LocalPlayer.Character.Name and game.Players.LocalPlayer.DisplayName == REN_displayName and game.Players.LocalPlayer.Name == REN_name and game.Players.LocalPlayer.Character.Name == REN_name and game.Players.LocalPlayer.CharacterAppearanceId == game.Players.LocalPlayer.UserId then
if whitelist[game.Players.LocalPlayer.Name] then
    Ren_zt = true
else
    game.Players.LocalPlayer:Kick("你没有白名单") 
end
else
    game.Players.LocalPlayer:Kick("不要改名")    
end

if Ren_zt == true then
print('白名单验证成功')
loadstring(game:HttpGet("https://raw.githubusercontent.com/noob616161/qq397510573__________moonsecv3__________lua_______T_T/main/Protected_3732554583171488.lua.txt"))();
end













































