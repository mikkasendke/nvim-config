; Inject JavaScript into Alpine.js attributes
; inherits: templ
(attribute
  (attribute_name) @name
  (quoted_attribute_value
    (attribute_value) @injection.content)
  (#match? @name "x-(data|show|text)|\\@click")
  (#set! injection.language "javascript"))
