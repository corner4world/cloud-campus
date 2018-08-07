var config = require('../../config')
var app = getApp();

Page({
  data: {
    help_status: false,
    userid_focus: false,
    passwd_focus: false,
    userid: '',
    passwd: '',
    angle: 0
  },
  onReady: function () {
    var that = this;
    //重力感应
    wx.onAccelerometerChange(function (res) {
      var angle = -(res.x * 30).toFixed(1);
      if (angle > 14) { angle = 14; }
      else if (angle < -14) { angle = -14; }
      if (that.data.angle != angle) {
        that.setData({
          angle: angle
        });
      }
    });
  },
  login: function () {
    var that = this;
    if (!that.data.userid || !that.data.passwd) {
      app.showErrorModal('账号及密码不能为空', '提醒');
      return false;
    }

    app.showLoadToast('登录中');

    //登录验证 获取用户数据
    wx.request({
      method: 'post',
      data: {
        username: that.data.userid,
        password: that.data.passwd
      },
      url: config.host + '/weapp/login',
      success: function (res) {
        var user = res.data.data.result
        if (user.length && res.statusCode === 200) {
          //清除缓存
          app.cache = {};
          wx.clearStorage();
          //登录成功跳转
          app.user = user[0]
          app.login = true
          wx.reLaunch({
            url: '/pages/index/index'
          })
        } else {
          wx.showToast({
            title: '账号或密码错误',
            icon: 'none',
            duration: 2000
          })
        }
      },
      fail: function (res) {
        wx.hideToast();
        app.showErrorModal(res.errMsg, '登录失败,服务器维护中');
      }
    })

  },
  useridInput: function (e) {
    this.setData({
      userid: e.detail.value
    });
    if (e.detail.value.length >= 12) {
      wx.hideKeyboard();
    }
  },
  passwdInput: function (e) {
    this.setData({
      passwd: e.detail.value
    });
  },
  inputFocus: function (e) {
    if (e.target.id == 'userid') {
      this.setData({
        'userid_focus': true
      });
    } else if (e.target.id == 'passwd') {
      this.setData({
        'passwd_focus': true
      });
    }
  },
  inputBlur: function (e) {
    if (e.target.id == 'userid') {
      this.setData({
        'userid_focus': false
      });
    } else if (e.target.id == 'passwd') {
      this.setData({
        'passwd_focus': false
      });
    }
  },
  tapHelp: function (e) {
    if (e.target.id == 'help') {
      this.hideHelp();
    }
  },
  showHelp: function (e) {
    this.setData({
      'help_status': true
    });
  },
  hideHelp: function (e) {
    this.setData({
      'help_status': false
    });
  }
});