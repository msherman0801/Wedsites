//= require jquery
//= require model
//= require myfetch


$('.website.show').ready(function() {
    const url = this.URL.split('')
    const websiteId = url[url.length-1]
    myFetch(`/websites/${websiteId}/data`, {method: 'get'})
        .then(data => data.json())
        .then(function(json) {
            appendData(json)
        })

    $('.modal').on('shown.bs.modal', function () {
        const first_name = document.getElementById('first_name').value
        const last_name = document.getElementById('last_name').value
        const website_id = document.getElementById('website_id').value
        showInvitationList(first_name, last_name, website_id)
        $(this).off('shown.bs.modal')
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
    myFetch(`/websites/${id}/invitations?firstname=${firstName}&lastname=${lastName}.json`)
            .then(response => response.json())
            .then(function(json) {
                $('#modal_body').html(`
                    <center>
                        <div class="container">
                            <div class="d-flex justify-content-center" style="margin-top: 5%;">
                                <div class="row">
                                    <div class="col-md-12">
                                        ${json.map(item => `
                                        ${item.first_name} ${item.last_name}
                                        <br />
                                        <button onClick="showInvitation(${item.website.id},${item.id})" class="btn btn-sm btn-info">Open Invitation</button>
                                        <hr style="width: 5%; border-bottom: 2px solid grey;">
                                        `)}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </center>
                `)
            })
            .catch(error => console.log(error))
}

function showInvitation(websiteId, id) {
    console.log(websiteId, id)
}