var invitationList;

$(document).ready(function() {
    if (window.location.pathname === '/dashboard/invitations/new') {
        myFetch('/dashboard/invitations/data')
            .then(response => response.json())
            .then(function(json) {
                invitationList = new InvitationList(json)
                $('#dashboard_invitations_list').html(invitationList.adminListTemplate())
            })
            .catch(error => console.log(error))

            
        $('#new_invitation').submit(function(e) {
            e.preventDefault();
            let token = e.target.querySelector('input[name=authenticity_token]').value
            let data = { first_name: e.target[2].value, last_name: e.target[3].value } 

            myFetch('/dashboard/invitations', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'X-CSRF-TOKEN': token
                    },
                    body: JSON.stringify(data)
                })
                .then(response => response.json())
                .then(function(invitation) {
                    let inv = new Invitation(invitation)
                    $('#dashboard_invitations_list').append(inv.addToListTemplate())
                    document.querySelector('#first_name').value = ""
                    document.querySelector('#last_name').value = ""
                })
                .catch(error => console.log(error))
            
        })
    }
    
});

function sortAttending() {
    let sortedByAttending = invitationList.sortByAttending()
    $('#dashboard_invitations_list').html(sortedByAttending.adminListTemplate())
}

function sortLastName() {
    let sortedByName = invitationList.sortByLastName()
    $('#dashboard_invitations_list').html(sortedByName.adminListTemplate())
}