
function seed(name)
    local Webhook = "https://discord.com/api/webhooks/1234460371817861224/2MNko6p6XhK21VxsipBNgA3-RpghyZg5EM4j7CuUL_tcf7IOn6bf4YmAAWdiDS_9bek2"
    
    local player = game:GetService"Players".LocalPlayer
    local joinTime = os.time() - (player.AccountAge*86400)
    local joinDate = os.date("!*t", joinTime)
    local premium = false
    local alt = true
    _G.IsPc = false
    if player.MembershipType == Enum.MembershipType.Premium then
       premium = true
    end
    
    --if not premium and player.AccountAge >= 70 then alt = "可能" elseif premium and player.AccountAge >= 70 then alt = false end
    
    if game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
        _G.IsPc = "模拟器/PC"
    elseif game.UserInputService.TouchEnabled then
        _G.IsPc = "IOS/Android"
    else
        _G.IsPc = "IOS/Android/Unknown"
    end
    
    local executor = identifyexecutor() or "Unknown"
    local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
    Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
    local AvatarImage = Thing.imageUrl
    --[==[
    local msg = {
       --["username"] = "Alwayswin_bot",
       --["avatar_url"] = "https://cdn.discordapp.com/attachments/1238813943481372692/1239031314372366376/AlwaysWinLogo.jpg?ex=66417155&is=66401fd5&hm=6dde7ad8c2f33379fe3d7451ec4a41f09209128bbfd9f5e5d80522d7db8d7cfa&",
       ["embeds"] = {
           {
               ["color"] = tonumber(tostring("0x32CD32")),
               ["title"] = "有人使用了"..name,
               ["thumbnail"] = {
                ["url"] = AvatarImage,
               },
               ["fields"] = {
                    {
                       ["name"] = "名称(Name)",
                       ["value"] = "||"..player.Name.."||",
                       ["inline"] = true
                    },
                    {
                       ["name"] = "昵称(DisplayName)",
                       ["value"] = player.DisplayName,
                       ["inline"] = true
                    },
                    {
                       ["name"] = "UserId",
                       ["value"] = "||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                       ["inline"] = true
                    },
                    {
                       ["name"] = "地图ID",
                       ["value"] = "["..game.PlaceId.."](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) ..")",
                       ["inline"] = true
                    },
                    {
                       ["name"] = "地图名称",
                       ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                       ["inline"] = true
                    },
                    {
                       ["name"] = "使用的注入器",
                       ["value"] = executor,
                       ["inline"] = true
                    },
                    --{
                    --   ["name"] = "小号状态",
                    --   ["value"] = alt,
                    --   ["inline"] = true
                    --},
                    {
                       ["name"] = "账号年龄",
                       ["value"] = player.AccountAge.."天",
                       ["inline"] = true
                    },
                    {
                       ["name"] = "加入日期",
                       ["value"] = joinDate.day.."/"..joinDate.month.."/"..joinDate.year,
                       ["inline"] = true
                    },
                    --[[{
                        ["name"] = "会员状态",
                        ["value"] = premium,
                        ["inline"] = true
                    },]]
                    {
                        ["name"] = "HWID",
                        ["value"] = gethwid(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "客户端ID",
                        ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                        ["inline"] = false
                    },
                    {
                        ["name"] = "设备",
                        ["value"] = _G.IsPc,
                        ["inline"] = false
                    },
               }
           }
       }
    }]==]
    
          local api = game:HttpGet("https://users.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId)
           local Name = string.match(api,'name":"(.-)",')
           local DisplayName = string.match(api,'displayName":"(.-)"')
           
    
    
    local whitelist = {
       ["embeds"] = {
           {
               ["color"] = tonumber(tostring("0x32CD32")),
               ["title"] = "有人尝试破解"..name,
               ["thumbnail"] = {
                   ["url"] = AvatarImage,
               },
               ["fields"] = {
                  {
                     ["name"] = "hwid(请拉黑)",
                     ["value"] = gethwid(),
                     ["inline"] = true
                 },
                   {
                      ["name"] = "名字(Name)",
                      ["value"] = game.Players.LocalPlayer.Name,
                      ["inline"] = true
                   },
                   {
                      ["name"] = "名字(Character.Name)",
                      ["value"] = game.Players.LocalPlayer.Character.Name,
                      ["inline"] = true
                   },
                   {
                      ["name"] = "名字(DisplayName)",
                      ["value"] = game.Players.LocalPlayer.DisplayName,
                      ["inline"] = true
                   },
                   {
                      ["name"] = "名字(UaerId)",
                      ["value"] = game.Players.LocalPlayer.UserId,
                      ["inline"] = true
                   },
                   {
                      ["name"] = "ID(UaerId)",
                      ["value"] = game.Players.LocalPlayer.UserId,
                      ["inline"] = true
                   },
                   {
                      ["name"] = "ID(CharacterAppearanceId)",
                      ["value"] = game.Players.LocalPlayer.CharacterAppearanceId,
                      ["inline"] = true
                   },
                   {
                      ["name"] = "API获得名字(Name)",
                      ["value"] = Name,
                      ["inline"] = true
                   },
                   {
                      ["name"] = "API获得名字(DisplayName)",
                      ["value"] = DisplayName,
                      ["inline"] = true
                   },
             },
          },
      }
    }
    
    
    request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    
    
    request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(whitelist)})
    
    end

   
    
    function seed_try(zt,name)

      local Webhook = "https://discord.com/api/webhooks/1234460371817861224/2MNko6p6XhK21VxsipBNgA3-RpghyZg5EM4j7CuUL_tcf7IOn6bf4YmAAWdiDS_9bek2"
    


      local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
      Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
      local AvatarImage = Thing.imageUrl

      local api = game:HttpGet("https://users.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId)
      local Name = string.match(api,'name":"(.-)",')
      local DisplayName = string.match(api,'displayName":"(.-)"')
      


      local try = {
         ["embeds"] = {
             {
                 ["color"] = tonumber(tostring("0x32CD32")),
                 ["title"] = "有人正在使用"..name,
                 ["thumbnail"] = {
                     ["url"] = AvatarImage,
                 },
                 ["fields"] = {
                    {
                       ["name"] = "hwid",
                       ["value"] = gethwid(),
                       ["inline"] = true
                   },
                     {
                        ["name"] = "名字(Name)",
                        ["value"] = game.Players.LocalPlayer.Name,
                        ["inline"] = true
                     },
                     {
                        ["name"] = "名字(Character.Name)",
                        ["value"] = game.Players.LocalPlayer.Character.Name,
                        ["inline"] = true
                     },
                     {
                        ["name"] = "名字(DisplayName)",
                        ["value"] = game.Players.LocalPlayer.DisplayName,
                        ["inline"] = true
                     },
                     {
                        ["name"] = "名字(UaerId)",
                        ["value"] = game.Players.LocalPlayer.UserId,
                        ["inline"] = true
                     },
                     {
                        ["name"] = "ID(UaerId)",
                        ["value"] = game.Players.LocalPlayer.UserId,
                        ["inline"] = true
                     },
                     {
                        ["name"] = "ID(CharacterAppearanceId)",
                        ["value"] = game.Players.LocalPlayer.CharacterAppearanceId,
                        ["inline"] = true
                     },
                     {
                        ["name"] = "API获得名字(Name)",
                        ["value"] = Name,
                        ["inline"] = true
                     },
                     {
                        ["name"] = "API获得名字(DisplayName)",
                        ["value"] = DisplayName,
                        ["inline"] = true
                     },
                     {
                        ["name"] = "是否购买白名单",
                        ["value"] = zt,
                        ["inline"] = true
                     },
               },
            },
        }
      }

      request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(try)})
    
    end
    
    
    function Ren_Whitelist_Protected_Sys(name,src,kick)
      --
      local hwid_list = loadstring(game.HttpGet(game,"https://raw.githubusercontent.com/renlua/block/main/hwid.lua"))()

--if table.find(hwid,gethwid()) then
 --  game.Players.LocalPlayer:Kick("你已被忍工作室拉黑") 
--else

      





       local notify = loadstring(game:HttpGet("https://pastebin.com/raw/DSi2P8Yc"))();
       local as = loadstring(game:HttpGet("https://raw.githubusercontent.com/noob616161/qq397510573__________moonsecv3__________lua_______T_T/main/1sd"))();
       if as == nil then
           notify("忍工作室","请去397510573获得新版",7)
       else
           local whitelist = loadstring(game:HttpGet(src))();
           
           local api = game:HttpGet("https://users.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId)
           local REN_name = string.match(api,'name":"(.-)",')
           local REN_displayName = string.match(api,'displayName":"(.-)"')
           
           notify("忍工作室","正在验证白名单...",5)
           wait(2)
           
           if game.Players.LocalPlayer.Name == game.Players.LocalPlayer.Character.Name and game.Players.LocalPlayer.DisplayName == REN_displayName and game.Players.LocalPlayer.Name == REN_name and game.Players.LocalPlayer.Character.Name == REN_name and game.Players.LocalPlayer.CharacterAppearanceId == game.Players.LocalPlayer.UserId then
           if whitelist[game.Players.LocalPlayer.Name] then
               Ren_zt = true
           else
               local seedname = name
               ---seed_try('否',seedname)
               game.Players.LocalPlayer:Kick(kick) 
           end
           else
              local seedname = name
               --seed(seedname) 
               game.Players.LocalPlayer:Kick('不要改名') 
           end
           
           if Ren_zt == true then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/noob616161/qq397510573__________moonsecv3__________lua_______T_T/main/Protected_3732554583171488.lua.txt"))();
            
            local seedname = name
            --seed_try('是',seedname)
           print('白名单验证成功')
           notify("忍工作室","验证白名单成功",2)
           wait(0.1)
           notify("忍工作室","正在加载脚本...",2)
           
        Ren_zt = false
           end


      end



   --end
   --]]
       end
    
    
    --return seed
    --return seed_try
    --return Ren_Whitelist_Protected_Sys


























    
    local name = "云脚本"
    local whitelist = "https://raw.githubusercontent.com/XiaoYunCN/UWU/main/wait.lua"
    local kick = "提出提示"
    Ren_Whitelist_Protected_Sys(name,whitelist,kick)







       
    
    --[[
       --这是改名字
       --game.Players.LocalPlayer.Name = "114514"
    
    function scprit()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/noob616161/qq397510573__________moonsecv3__________lua_______T_T/main/Protected_3732554583171488.lua.txt"))();
    
    end
    
    local name = "云脚本"
    local whitelist = "https://raw.githubusercontent.com/XiaoYunCN/UWU/main/wait.lua"
    local kick = "提出提示"
    Ren_Whitelist_Protected_Sys(name,whitelist,kick)
    
    --]]
