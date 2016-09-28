Param(
[string]$Resource
)

azure config  mode arm

#Removes Resource Groups with positional parameters as specified above
azure group delete $Resource