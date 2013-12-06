App.AchievementsRoute = Ember.Route.extend
  model: -> App.Achievement.find()
