
App.AchievementsRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin)

App.AchievementsRoute.reopen
  model: ->
    App.Achievement.find()


