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