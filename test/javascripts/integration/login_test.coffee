module "App Authentication",
  setup: ->
    Ember.run(App, App.advanceReadiness)
  teardown: ->
    App.reset()

test "root lists first page of posts", ->
  visit("/").then ->
    equal find(".post").length, 5, "The first page should have 5 posts"

test "creating a post displays the new post", ->
  visit("/posts/new").then(->
    fillIn ".post-title", "A new post"
  ).then(->
    fillIn ".post-author", "John Doe"
  ).then(->
    click "button.create"
  ).then ->
    ok find("h1:contains('A new post')").length, "The post's title should display"
    ok find("a[rel=author]:contains('John Doe')").length, "A link to the author should display"

test "creating a post displays the new post", ->
  visit("/posts/new").fillIn(".post-title", "A new post").fillIn(".post-author", "John Doe").click("button.create").then ->
    ok find("h1:contains('A new post')").length, "The post's title should display"
    ok find("a[rel=author]:contains('John Doe')").length, "A link to the author should display"

