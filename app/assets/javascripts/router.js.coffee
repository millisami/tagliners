# For more information see: http://emberjs.com/guides/routing/

# Tagliners.Router.map ()->
#   # @resource('posts')

App.Router.reopen
  location: 'history'
  rootURL: '/'

App.Router.map ->
  @resource 'users', ->
    @route 'show',
      path: '/:user_id'
    @route 'new'
    @route 'edit',
      path: '/:user_id/edit'

  @resource 'achievements'

App.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')

App.UsersRoute = Ember.Route.extend
  model: ->
    App.User.find()
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

App.UsersNewRoute = Ember.Route.extend
  model: ->
    App.User.createRecord()
  setupController: (controller, model) ->
    controller.set('content', model)

App.UsersShowRoute = Ember.Route.extend
  model: (params) ->
    App.User.find(params.user_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

App.UsersEditRoute = Ember.Route.extend
  model: (params) ->
    App.User.find(params.user_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

# App.UsersShowRoute = App.UserRoute.extend
# App.UsersEditRoute = App.UserRoute.extend

