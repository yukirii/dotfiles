vimfx.listen('getSelection', (data, callback) => {
  let selection = content.getSelection().toString()
  callback(selection)
})

vimfx.listen('getCurrentPageUrl', (data, callback) => {
  let href = content.location.href
  callback(href)
})
