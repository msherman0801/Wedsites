class Website {
    constructor(key, id) {
        this.id = id;
        this.key = key;
    }

    dashTemplate() {
        return `<div class="col-md-3" style="padding: 20px;">
                    <div class="card" style="width: 18rem;">
                            <div class="card-body">
                            <h5 class="card-title">${this.key}</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <div class="col-md-6">
                                    <a href="/websites/${this.id}" class="btn btn-sm btn-primary" style="width: 100%;">Launch</a>
                                </div>
                                <div class="col-md-6">
                                    <a href="/websites/${this.id}" class="btn btn-sm btn-primary" style="width: 100%;">Settings</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>`
    }

    showTemplate() {
        
    }
}




class Invitation {
    constructor(id, firstName, lastName) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
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