App.AchievementsController = Ember.ArrayController.extend

  sortProperties: [ 'achievedAt' ]
  sortAscending: false

  addAchievement: ->
    App.Achievement.createRecord
      title: @get('newAchievement')
      achievedAt: new Date()
    @set('newAchievement', '')
    @get('store').commit()