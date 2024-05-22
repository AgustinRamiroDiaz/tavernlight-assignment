--[[

# Q1 - Fix or improve the implementation of the below methods

local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player)
    end
    return true
end

# Train of thought

- What does the 1000 represent? some kind of id?
- Seems like these functions in the player are from https://github.com/otland/docs/blob/master/tfs-documentation/lua_functions.md#Game-getStorageValue
- I understand now that 1000 is the id of the storage value
- Hardcoded values are bad, I will remove them and add them
    - I could either add them as parameters or as constants. I'd decide based on the relationship of this code with external callers. Since I don't have any context, I'll go with constants because I'm assuming that the storage id can be an implementation detail of the module which should not be exposed to the caller.
- I see that the storage value is only -1 or 1. I'll make this into a boolean value instead because it's more appropriate.
- I'm not sure what the 1000 represents, but given its usage it seems like it holds some data about the player which needs to be released when the player logs out. I'll rename it to loggedStateThatNeedsRelease to make it more clear.
- addEvent seems to follow the pattern of process(function, args...), therefore I'll change the releaseStorage function to accept the id of the storage as an argument.
- addEvent is not defined. I'll assume it's a global function and I'll define it as a simple "apply" function. In a real-world scenario, I imagine addEvent probably comes from some library or framework which handles events in some sort of event loop with a scheduler and a queue.
- I'll leave onLogout as global given that it's probably called by some external system.
- onLogout always returns true, which doesn't make sense because return values should be meaningful. Given that I don't have any context, I'll remove it because it doesn't make sense for me.
]]

-- Lua 5.4 added the <const> keyword, which is a good practice to use for constants. I'm not adding it here because I'm assuming that the codebase is not using Lua 5.4 yet since it's relatively new.
local loggedStateThatNeedsRelease = 1000

local function releaseStorage(storageId, player)
    player:setStorageValue(storageId, false)
end

local function addEvent(func, ...)
    func(...)
end

function onLogout(player)
    if player:getStorageValue(loggedStateThatNeedsRelease) then
        addEvent(releaseStorage, loggedStateThatNeedsRelease, player)
    end
end
