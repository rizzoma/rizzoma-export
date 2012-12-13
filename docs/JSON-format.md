Data to export is presented as a single tree-like [JSON]. Here is small example how some topic will look (of course it will be not so pretty formatted):
```json
{
    "type": "topic",
    "url": "http://example.com/topic/",
    "title": "The smallest topic ever",
    "nodes": [{
        "type": "reply",
        "timestamp": 1234567890,
        "author": {
            "email": "alice@wonderla.nd",
            "name": "Alice"
        },
        "nodes": [{
            "type": "paragraph",
            "nodes": [{
                "type": "text",
                "bgColor": "rgb(255, 255, 255)",
                "nodes": [{
                    "type": "text",
                    "value": "The smallest topic ever"
                }]
            }]
        }]
    }]
}
```
See below which nodes are exist and what attributes they have. Optional attributes are non-bold.  
Each node has attribute "type" also that indicates type of the node.  
__Important: any of described structures is not of final version and may be changed!__  

## Data structures
### Date string
Represents date. Format is described by [ISO 8601] e.g. 2012-12-29T18:00:00.000Z.  
All dates provided on UTC.

### User object
Contains information about some user.
* __email__: _string_, email
* __name__: _string_, name
* avatar: _string_, URL of avatar picture

## Nodes
### Topic node (type="topic")
Top-level node which contains all data.
* __url__: _string_, URL of the topic
* __title__: _string_, title of the topic
* __nodes__: _array_, list of first-level replies

### Reply node (type="reply")
Each reply is transformed to single node.
* __id__: _string_, unique ID of the reply
* __author__: _[user]_, some information about author
* __timestamp__: _[date]_, timestamp of last content change
* __nodes__: _array_, list of child nodes of the reply
  
### Paragraph node (type="paragraph")
Paragraph node defines a single text block that should be ended up with newline.
* bulleted: _boolean_, _true_ if text block is a list item
* __nodes__: _array_, list of child nodes of the paragraph

### Text node (type="text")
Text nodes are used for various text presentations: links, styles, background color etc.  
Each node will contain single attribute only (except "nodes"). The "nodes" attribute may be paired with any another.
* url: _string_, URL if text is a link
* bold: _boolean_, _true_ if text is bold
* italic: _boolean_, _true_ if text is italic
* struckthrough: _boolean_, _true_ if text is struckthrough
* underlined: _boolean_, _true_ if text is underlined
* bgColor: _string_, CSS color value of the text
* value: _string_, value of the text
* nodes: _array_, list of child nodes of the text

### Tag node (type="tag")
Tag is a keyword prepended by the "#" symbol.
* __value__: _string_, text value of the tag

### Attachment node (type="attachment")
* __url__: _string_, URL of the attachment
  
### File node (type="file")
Any uploaded file.
* __name__: _string_, name of the file
* __url__: _string_, URL of the file
* preview: _string_, URL of a small thumbnail

### Recipient node (type="recipient")
Also known as "mention". This is a link to some user, prepended by the "@" symbol.
* __user__: _[user]_, some information about recipient

### Task node (type="task")
Similar to the "recipient" node but has an extra functionality.
* __user__: _[user]_, some information about recipient
* __deadline__: _[date]_, timestamp when the task will expire
* __completed__: _boolean_, _true_ if task is already completed

[JSON]: http://en.wikipedia.org/wiki/JSON
[ISO 8601]: http://en.wikipedia.org/wiki/ISO_8601
[date]: #date-string
[user]: #user-object
