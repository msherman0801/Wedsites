//= require jquery
//= require model
//= require myfetch


$('.website.show').ready(function() {
    const url = this.URL.split('')
    const websiteId = url[url.length-1]
    myFetch(`/websites/${websiteId}/data`, {method: 'get'})
        .then(data => data.json())
        .then(function(json) {
            
        })


    
})