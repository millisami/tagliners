App.FlashMessage = Ember.Object.extend({
  type: "notice",
  message: null,
  isNotice: (function() {
    return this.get("type") === "notice";
  }).property("type").cacheable(),
  isWarning: (function() {
    return this.get("type") === "warning";
  }).property("type").cacheable(),
  isError: (function() {
    return this.get("type") === "error";
  }).property("type").cacheable()
});

App.FlashView = Ember.View.extend({
  contentBinding: "App.FlashController.content",
  classNameBindings: ["isNotice", "isWarning", "isError"],
  isNoticeBinding: "content.isNotice",
  isWarningBinding: "content.isWarning",
  isErrorBinding: "content.isError",

  didInsertElement: function() {
    this.$("#message").hide();
    return App.FlashController.set("view", this);
  },

  show: function(callback) {
    return this.$("#message").css({
      top: "-40px"
    }).animate({
      top: "+=40",
      opacity: "toggle"
    }, 500, callback);
  },

  hide: function(callback) {
    return this.$("#message").css({
      top: "0px"
    }).animate({
      top: "-39px",
      opacity: "toggle"
    }, 500, callback);
  }
});

App.FlashController = Ember.Object.create({
  content: null,
  clearContent: function(content, view) {
    return view.hide(function() {
      return App.FlashQueue.removeObject(content);
    });
  }
});

App.FlashController.addObserver('content', function() {
  if (this.get("content")) {
    if (this.get("view")) {
      this.get("view").show();
      return setTimeout(this.clearContent, 4000, this.get("content"), this.get("view"));
    }
  } else {
    return App.FlashQueue.contentChanged();
  }
});

App.FlashQueue = Ember.ArrayProxy.create({
  content: [],
  contentChanged: function() {
    var current;
    current = App.FlashController.get("content");
    if (current !== this.objectAt(0)) {
      return App.FlashController.set("content", this.objectAt(0));
    }
  },
  pushFlash: function(type, message) {
    return this.pushObject(App.FlashMessage.create({
      message: message,
      type: type
    }));
  }
});

App.FlashQueue.addObserver('length', function() {
  return this.contentChanged();
});

// USAGE
// App.FlashQueue.pushFlash('notice', 'This actually works!!!');
// By defining the following method, we can render in short with
// App.setFlash('notice', 'This actually works!!!');
App.setFlash = function(type, mesg) {
  App.FlashQueue.pushFlash(type, mesg);
}
