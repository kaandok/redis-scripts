local amount = tonumber(ARGV[1])
local final_set = {}

for _,key in pairs(KEYS) do
    local member_controller = {}
    local member_controller_count = 0
    repeat
        local candidate = redis.call('srandmember',key)
        if not member_controller[candidate] then
            member_controller[candidate] = true
            member_controller_count = member_controller_count + 1
        end
    until member_controller_count == amount
    
    for k,_ in pairs(member_controller) do
        final_set[#final_set+1] = k
    end
end

return final_set
