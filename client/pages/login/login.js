var config = require('../../config')
var app = getApp();

Page({
  data: {
    school: [],
    index:0,
    school_code:"100001",
    help_status: false,
    userid_focus: false,
    passwd_focus: false,
    userid: '',
    passwd: '',
    angle: 0,
    phone:'',
    password:''
  },
  onLoad:function(){
    this.fetch_school()
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
        phone: that.data.userid,
        password: that.data.passwd,
        school_code:that.data.school_code
      },
      url: config.host + '/weapp/login',
      success: function (res) {
        var user = res.data.data.result
        if (user.length && res.statusCode === 200) {
          //清除缓存 todo
          //登录成功跳转
          app.user = user[0]
          app.level = user[0].level
          app.school_code = user[0].school_code
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
        app.showErrorModal(res.errMsg, '登录失败,网络故障或服务器维护中');
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
  },
  bindPickerChange: function (e) {
    var index = e.detail.value * 1
    var school_code = this.data.school[index].school_code
    this.setData({
      index:index,
      school_code: school_code
    })
    app.school_code = school_code
  },
  phoneInput:function(e){
    this.setData({
      phone:e.detail.value
    })
  },
  passwordInput:function(e){
    this.setData({
      password: e.detail.value
    })
  },
  fetch_school:function(){
    var that = this
    wx.request({
      method: 'post',
      data: {},
      url: config.host + '/weapp/school',
      success: function (res) {
        var result = res.data.data.result
        if (result.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            school:result
          })
        }
      },
      fail: function (res) {
        wx.hideToast();
        app.showErrorModal(res.errMsg, '获取学校列表失败,服务器维护中');
      }
    })
  },
  visitor:function(){
    wx.navigateTo({
      url: '/pages/visitor/visitor',
    })
  },
  //激活验证 添加用户 //todo 方法迁移至个人中心 修改密码
  register:function(){
    var that = this;
    if (!that.data.phone || !that.data.password) {
      app.showErrorModal('账号及密码不能为空', '提醒');
      return false;
    }
    if (that.data.phone.length < 11) {
      app.showErrorModal('手机号格式不正确', '提醒');
      return false;
    }
    if (that.data.password.length < 6) {
      app.showErrorModal('密码至少6位', '提醒');
      return false;
    }
    app.showLoadToast('激活中');
    wx.request({
      method: 'post',
      data: {
        level:that.data.level,
        phone: that.data.phone,
        password: that.data.password
      },
      url: config.host + '/weapp/register',
      success: function (res) {
        var status = res.data.data.status
        if (status == 1 && res.statusCode === 200 && res.data.code != -1) {
          wx.showToast({
            title: '激活成功!',
            icon: 'none',
            duration: 2000
          })
          that.hideHelp();
        } 
        else if (status == 0 && res.statusCode === 200 && res.data.code != -1){
          wx.showToast({
            title: '账号已经激活 请登录',
            icon: 'none',
            duration: 2000
          })
        }
        else {
          wx.showToast({
            title: '手机号未录入系统 请联系学校',
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
  }
});