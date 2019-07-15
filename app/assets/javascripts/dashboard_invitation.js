$(document).ready(function() {
    if (window.location.pathname === '/dashboard/invitations/new') {
        myFetch('/dashboard/invitations/data')
            .then(response => response.json())
            .then(function(json) {
                let data = new InvitationList(json)
                $('#dashboard_invitations_list').html(data.adminListTemplate())
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
                .then(function(json) {
                    let inv = new Invitation(json.id, json.first_name, json.last_name, json.website.id)
                    $('#dashboard_invitations_list').append(inv.addToListTemplate())
                })
                .catch(error => console.log(error))
            
        })
    }
});
