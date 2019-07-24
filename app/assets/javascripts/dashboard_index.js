//= require jquery
//= require model
//= require myfetch

$(document).ready(function() {
    if (window.location.pathname === '/dashboard/home') {
        websiteList(); //Preloads full list of user-owned websites

        $('#new_website').submit(function(e) { //AJAX new website form submission
            e.preventDefault();
            let data = { website: { key: e.target[2].value } }
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
                    let web = new Website(website)
                    appendList('#website_list', web)
                    e.target.querySelector('input[type=submit]').disabled = false
                    e.target[2].value = ""
                })
                .catch(error => console.log(error))
        })
        // myFetch('/dashboard/websites/active') // Checks for current website and updates
        //     .then(response => response.json())
        //     .then(function(json) {
        //         let active = document.getElementById(`${json.id}`).parentNode
        //         active.style.borderTopWidth = '3px'
        //         active.style.borderTopStyle = 'solid'
        //         active.style.borderTopColor = 'green'
        //     })
        //     .catch(error => console.log(error))


        function websiteList() {
            myFetch('/websites')
                .then(data => data.json())
                .then(function(data) {
                    data.websites.forEach(function(website) {
                        let web = new Website({key: website.key, id: website.id, summary: website.content.summary})
                        appendList('#website_list', web)
                    })
                    assignActive(data.current_website)
                })
                .catch(error => console.log(error))
        }

        function assignActive(website) {
            let active = document.getElementById(`${website.id}`).parentNode
            active.style.borderTopWidth = '4px'
            active.style.borderTopStyle = 'solid'
            active.style.borderTopColor = 'green'
            active.style.marginTop = '-4px'
        }
        
        function appendList(list, item) {
            $(list).append(item.dashTemplate());
        }
    }

});
