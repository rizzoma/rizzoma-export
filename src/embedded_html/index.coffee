swig = require('swig')

template = swig.compileFile("#{__dirname}/template.html")

exports.toEmbeddedHtml = (data) ->
    return template.render({topic: data})
