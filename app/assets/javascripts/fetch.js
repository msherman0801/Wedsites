$(function() {
    const form = $('#new_website')
    form.submit(function(e) {
        e.preventDefault();
        let data = { website: { key: e.target[2].value } }

        let token = e.target.querySelector('input[name=authenticity_token]').value

        myFetch('/websites', {
            method: "POST",
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'X-CSRF-token': token
            },
            body: JSON.stringify(data)
            
          })
            .then(data => data.json())
            .then(json => console.log(json))
            .catch(error => console.log(error))

    })
});

function myFetch(url, options) {
    if (options == null) options = {}
    if (options.credentials == null) options.credentials = 'same-origin'
    return fetch(url, options).then(function(response) {
      if (response.status >= 200 && response.status < 300) {
        return Promise.resolve(response)
      } else {
        var error = new Error(response.statusText || response.status)
        error.response = response
        return Promise.reject(error)
      }
    })
  }