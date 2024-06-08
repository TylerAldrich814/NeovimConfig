--> NuiTerm/debug.lua
--

MSG_ID = 0
local debug_active = false
local function DEBUG(msg)
  if debug_active then
    print(" - [" .. MSG_ID .. "] :: " .. msg)
    MSG_ID = MSG_ID + 1
  end
end

return {
  DEBUG = DEBUG,
}
