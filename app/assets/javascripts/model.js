class Website {
    constructor(website) {
        this.id = website.id;
        this.key = website.key;
        this.summary = website.summary
        
    }

    dashTemplate() {
        return `<div class="col-md-3" style="padding: 10px; padding-bottom: 20px; border-bottom: 1px solid rgba(33,33,33,.1);>
                    <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title">${this.key}</h5>
                                <input type="hidden" id=${this.id}>
                                <p class="card-text">${this.summary}</p>
                                <a href="/dashboard/websites/${this.id}/active" class="btn btn-sm btn-primary">Activate</a>
                            </div>
                        </div>
                    </div>
                </div>`
    }

    showTemplate() {
        
    }
}




class Invitation {
    constructor(invitation) {
        this.id = invitation.id;
        this.firstName = invitation.firstName;
        this.lastName = invitation.lastName;
        this.websiteId = invitation.websiteId;
    }

    showTemplate() {
        return `<div class="container">
            <div class="d-flex justify-content-center" style="margin-top: 5%;">
                <div class="row">
                    <div class="col-md-12">
                        <form id="edit_invitation" class="form-horizontal">
                            <fieldset>
                                <h3 style="font-family: 'Parisienne', cursive;">Invitation for</h3>
                                <h1 style="font-size: 40px;">${this.firstName} ${this.lastName}</h1>
                                <hr>

                                <div class="form-group">
                                    <label class="col-lg-3 control-label" style="font-size: 12px;">Will you be attending?</label>
                                    <div class="col-lg-9">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="attending" id="attending" value="true" checked="">
                                                Attending
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="attending" id="attending" value="false">
                                                Not Attending
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="select" class="col-lg-3 control-label" style="font-size: 12px;">Guests</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="select" name="guests">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        </select>
                                        <br>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="textArea" class="col-lg-3 control-label" style="font-size: 12px;">Allergies?</label>
                                    <div class="col-lg-9">
                                        <textarea class="form-control" rows="3" id="textArea" name="allergies"></textarea>
                                        <span class="help-block">To best identify dining choices, we ask that you specify any food allergies you or your guests may have.</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-3">
                                        <button id="edit_invitation_submit" type="submit" class="btn btn-lg btn-info">Submit</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                </div>
            </div>
        </div>
        `
    }

    addToListTemplate() {
        return `
            <tr>
                <th><a href="/websites/${this.websiteId}/invitations"><h6>Open</h6></a></th>
                <td>${this.firstName}</td>
                <td>${this.lastName}</td>
            </tr>
        `
    }
}

class InvitationList {
    constructor(json) {
        this.json = json
    }

    listTemplate() {
        return `
        <center>
            <div class="container">
                <div class="d-flex justify-content-center" style="margin-top: 5%;">
                    <div class="row">
                        <div class="col-md-12">
                            ${this.json.map(item => `
                            ${item.first_name} ${item.last_name}
                            <br />
                            <button onClick="showInvitation({websiteId: ${item.website.id}, id: ${item.id}, firstName: '${item.first_name}', lastName: '${item.last_name}'} )" class="btn btn-sm btn-info">Open</button>
                            <hr style="width: 5%; border-bottom: 2px solid grey;">
                            `)}
                        </div>
                    </div>
                </div>
            </div>
        </center>
        `
    }
    //<th><%= link_to "Open Invitation", website_invitations_path(current_website, i), class: "h6" %></th>
     ///websites/:website_id/invitations
     //rails_blob_representation
    adminListTemplate() {
        
        return this.json.map(function(item) {
            let attending;

            if (item.attending === true) {
               attending = "<td class='text-success'>Yes</td>"
            } else if (item.attending === false) {
               attending = "<td class='text-danger'>No</td>"
            } else {
               attending = "<td></td>"
            }

            return `
                <tr>
                    <th><a href="/websites/${item.website.id}/invitations"><h6 class="text-info">Open</h6></a></th>
                    <td>${item.first_name}</td>
                    <td>${item.last_name}</td>
                    <td>${item.date_responded !== null ? item.date_responded.split('').splice(0,10).join('') : ""}</td>
                        ${attending}
                    <td>${item.guests !== null ? item.guests : ""}</td>
                    <td>${item.allergies !== null ? item.allergies : ""}</td>
                </tr>
            `
        })
    }

    sortByLastName() {
        this.json = this.json.sort(function(a, b) {
            var nameA = a.last_name.toUpperCase(); // ignore upper and lowercase
            var nameB = b.last_name.toUpperCase(); // ignore upper and lowercase
            if (nameA < nameB) {
              return -1;
            }
            if (nameA > nameB) {
              return 1;
            }
          
            // names must be equal
            return 0;
          });
        return this;
    }

    sortByAttending() {
        this.json = this.json.sort(function(a, b) {
            var yes = a.attending // ignore upper and lowercase
            var no = b.attending // ignore upper and lowercase
            if (yes < no) {
              return 1;
            }
            if (yes > no) {
              return -1;
            }
          
            // names must be equal
            return 0;
          });
        return this;
    }


}


class DashboardInvitationList {
    constructor(invitations) {
        this.invitations = invitations
    }

    listTemplate() {
        return `
        <center>
            <div class="container">
                <div class="d-flex justify-content-center" style="margin-top: 5%;">
                    <div class="row">
                        <div class="col-md-12">
                            ${this.invitations.map(item => `
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
        `
    }
}


class WebsiteEventList {
    constructor(events) {
        this.events = events
    }


    listTemplate() {
        if (this.events.length > 0) {
            return `
                <div class="row">
                        ${this.events.map(function(event) {
                        return `<div class="col-md-4">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h2>${ event.title }</h2>
                                </div>
                                <div class="panel-body">
                                    <p class="panel-paragraph">Description</p>
                                    <p>${ event.description }</p>
                                    <p class="panel-paragraph">Date</p>
                                    <p><small>${ event.date }</small></p>
                                    <p class="panel-paragraph">Location</p>
                                    <p>${ event.location }</p>
                                    <p class="panel-paragraph">Attire</p>
                                    <p>${ event.attire }</p>
                                </div>
                            </div>
                        </div>
                        `
                        })
                    }
                </div>`
        } else {
            return `<div class="col-md-12">
                <center> 
                    <h1>There are no events yet!</h1>
                </center>
            </div>`
        }
    }
}