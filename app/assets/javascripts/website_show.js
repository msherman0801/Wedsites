//= require jquery
//= require model
//= require myfetch


$('.website.show').ready(function() {
    const url = this.URL.split('')
    const websiteId = url[url.length-1]
    myFetch(`/websites/${websiteId}/data`, {method: 'get'})
        .then(data => data.json())
        .then(function(json) {
            console.log('trest')
            appendData(json)
        })
    
    $('.modal').on('shown.bs.modal', function () {
        const first_name = document.getElementById('first_name').value
        const last_name = document.getElementById('last_name').value
        const website_id = document.getElementById('website_id').value
        if ((first_name === "") || (last_name === "")) {
            $('#modal_body').html(`<h3 class="text-danger text-center">Please fill out both first name and last name.</h3>`)
        } else {
            showInvitationList(first_name, last_name, website_id)
        }
        $(this).off('show.bs.modal')
    })
})

function appendData(data) {
    $('#content_about_us').text(`${data.content.about_us}`)
    $('#content_date').text(`${data.content.date}`)
    $('#content_location').text(`${data.content.location}`)
    $('#content_summary').text(`${data.content.summary}`)
    $('#content_contact_name').text(`${data.content.contact_name}`)
    $('#content_contact_number').text(`${data.content.contact_number}`)
}

function showInvitationList(firstName, lastName, id) {
    myFetch(`/websites/${id}/invitations?first_name=${firstName}&last_name=${lastName}`,{
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
            .then(response => response.json())
            .then(function(json) {
                if (json.length === 0) {
                    $('#modal_body').html(`<h3 class="text-danger text-center">No invitation was found under that name.</h3>`)
                } else {
                    let list = new InvitationList(json)
                $('#modal_body').html(list.listTemplate())}
            })
            .catch(error => console.log(error))
}

function showInvitation(websiteId, id) {
    myFetch(`/websites/${websiteId}/invitations/${id}/edit.json`)
        .then(response => response.json())
        .then(function(inv) {
            let invitation = new Invitation(inv.id, inv.first_name, inv.last_name)
            $('#modal_body').html(invitation.showTemplate())

            document.getElementById('edit_invitation').addEventListener('submit', function(e) {
                e.preventDefault();
                let token = document.getElementById('authenticity_token').value
                const data = {}
                data.attending = true ? e.target[1].checked : false
                data.guests = e.target[3].value
                data.allergies = e.target[4].value

                myFetch(`/websites/${websiteId}/invitations/${id}`, {
                    method: 'PATCH',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'X-CSRF-token': token
                    },
                    body: JSON.stringify(data)
                })
                    .then(response => response.json())
                    .then(function(json) {
                        if (json.id) {
                            $('#modal_body').html(`<h2 class="te xt-info text-center">Thank you for your response.</h2>`)
                        } else {
                            $('#modal_body').html(`<h2 class="text-danger text-center">Uh oh! There was an issue and your invitation was not received.</h2>`)
                        }
                    })
                    .catch(error => console.log(error))
            })
        })
        .catch(error => console.log(error))
}




