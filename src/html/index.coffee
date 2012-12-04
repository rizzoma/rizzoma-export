swig = require('swig')

template = swig.compileFile("#{__dirname}/template.html")

exports.toHtml = (data) ->
    return template.render({topic: data})
