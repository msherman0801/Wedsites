//= require jquery
//= require model
//= require myfetch

$('.dashboard .index').ready(function() {
    websiteList(); //Preloads full list of user-owned websites

    $('#new_website').submit(function(e) { //AJAX new website form submission
        e.preventDefault();
        
        let data = { website: { key: e.target[2].value } }
        console.log(data)
        let token = e.target.querySelector('input[name=authenticity_token]').value
        fetch('/websites', {
            method: "POST",
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'X-CSRF-token': token
            },
            body: JSON.stringify(data)
          })
            .then(data => data.json())
            .then(function(website) {
                debugger
                let web = new Website(website.id, website.key)
                appendList('#website_list', web)
                e.target.querySelector('input[type=submit]').disabled = false
                e.target[2].value = ""
            })
            .catch(error => console.log(error))
    })


    function websiteList() {
        myFetch('/websites')
            .then(data => data.json())
            .then(function(data) {
                data.forEach(function(website) {
                    let web = new Website(website.key, website.id)
                    appendList('#website_list', web)
                })
            })
            .catch(error => console.log(error))
    }
    
    function appendList(list, item) {
        $(list).append(item.dashTemplate());
    }

});
