if current_user
  json.user current_user
else
  json.errorMessage "Authentication failed"
  json.errorCode "401"
end
