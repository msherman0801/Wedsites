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