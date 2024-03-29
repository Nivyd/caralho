local HttpService = game:GetService("HttpService")
  local RequestFunction
  
  if syn and syn.request then
    RequestFunction = syn.request
  elseif request then
    RequestFunction = request
  elseif http and http.request then
    RequestFunction = http.request
  elseif http_request then
    RequestFunction = http_request
  end
  
  local DiscordApiUrl = "http://127.0.0.1:%s/rpc?v=1"
  
 
  
  for i = 6453, 6464 do
    local DiscordInviteRequest = function()
        local Request = RequestFunction({
            Url = string.format(DiscordApiUrl, tostring(i)),
            Method = "POST",
            Body = HttpService:JSONEncode({
                nonce = HttpService:GenerateGUID(false),
                args = {
                    invite = {code = getgenv().Codigo},
                    code = getgenv().Codigo -- sexo
                },
                cmd = "INVITE_BROWSER"
            }),
            Headers = {
                ["Origin"] = "https://discord.com",
                ["Content-Type"] = "application/json"
            }
        })
    end
    spawn(DiscordInviteRequest)
  end
