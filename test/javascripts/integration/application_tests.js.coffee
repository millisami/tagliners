module "EmberJS Application Template",
  setup: ->
    Ember.run(App, App.advanceReadiness)
  teardown: ->
    App.reset()

test "default template", ->
  visit("/").then ->
    ok exists("*"), "Found Some HTML"

