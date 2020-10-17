Function Compare-ADGroups {

# Enter First AD User 
$user1 = Read-Host "Enter the identity of the first AD User" 
 
# Get AD group membership of User1 
$member1 = Get-ADPrincipalGroupMembership -Identity $user1 
 
# Enter Second AD User 
$user2 = Read-Host "Enter the identity of the second AD User" 
 
# Get AD group membership of User2 
$member2 = Get-ADPrincipalGroupMembership -Identity $user2 

# Ask to Include Groups Both are in
$include = Read-Host "Include groups that $user1 and $user2 are both in? (Y on N)?: "
if ($include -eq "Y" -OR $include -eq "Yes"){
# Output Message 
Write-Host 
"$user1 and $user2 have the following difference in AD group membership. 
The SideIndicator indicates which AD user was found in the corresponding AD group.  
$user1 is a member of SideIndicator <= and $user2 is a member of SideIndicator => 
Groups that both users are a part of will show ==. 
" 
 
# Compare user1 membership to user2 membership and display only the difference in membership. Only show the name of the group and sort alphabetically. 
# The SideIndicator indicates which AD user was found in the corresponding AD group. 
Compare-Object -ReferenceObject ($member1) -DifferenceObject ($member2) -IncludeEqual -Property Name | Sort Name
}
else {
# Output Message 
Write-Host 
"$user1 and $user2 have the following difference in AD group membership. 
The SideIndicator indicates which AD user was found in the corresponding AD group.  
$user1 is a member of SideIndicator <= and $user2 is a member of SideIndicator => 
Groups that both users are in will not be displayed. 
" 
 
# Compare user1 membership to user2 membership and display only the difference in membership. Only show the name of the group and sort alphabetically. 
# The SideIndicator indicates which AD user was found in the corresponding AD group. 
Compare-Object -ReferenceObject ($member1) -DifferenceObject ($member2) -Property Name | Sort Name
}
}
