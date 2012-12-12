swig = require('swig')

template = swig.compileFile("#{__dirname}/template.html")

exports.toHtml = (data) ->
    parent = "#{__dirname}/../embedded_html/template.html"
    return template.render({template: parent, topic: data})
