
App.AchievementsRoute = Ember.Route.extend
  model: ->
    App.Achievement.find()

App.AchievementsRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin)