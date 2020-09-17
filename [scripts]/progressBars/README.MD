-- Found on: https://modit.store
-- ModFreakz Discord: https://discord.gg/4S7FcFs

-- Example of how to use, with test command.
-- local disableControls = {30,31,32,33,34,35}   -- controls to disable
-- local progressTimer = 5                       -- seconds
-- local progressMsg = "My test message"
-- RegisterCommand('progbar', function(source,args) 
--   local time = (args and args[1] and tonumber(args[1]) or progressTimer)
--   local msg = (args and args[2] and tostring(args[2]) or progressMsg)
--   exports["progbars"]:StartProg(time,msg,disableControls);
-- end)

-- To open via export:
-- exports["progbars"]:StartProg(time,msg)

-- To close via export:
-- exports["progbars"]:CloseProg()