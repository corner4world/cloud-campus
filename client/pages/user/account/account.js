const app = getApp()
var config = require('../../../config')
Page({
  data: {
    userInfo: {},
    items: [],
    is_modify:false,
    is_pwdmodify:false,
    text:'',
    value:'',
    field:'',
    index:0
  },
  onLoad() {
    this.UserInfo()
  },
  modify(e) {
    var data = e.currentTarget.dataset
    var that = this
    that.setData({
      is_modify:true
    })
    var field = data.field
    var text = data.text
    var value = data.value
    var index = data.index
    that.setData({
      text: text,
      value: value,
      field: field,
      index: index
    })
  },
  pwd_modify:function(){
    var that = this
    that.setData({
      is_pwdmodify: true
    })
  },
  UserInfo() {
    var that = this
    var user = app.user
    var items = that.data.items
    var username = {
      icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/username.png',
      text: '名称',
      value: user.username,
      field:"username"
    }
    var phone = {
      icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/phone.png',
      text: '手机',
      value: user.phone,
      field: "phone"
    }
    var description = {
      icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/des.png',
      text: '称谓',
      value: user.description,
      field: "description"
    }
    items.push(username)
    items.push(phone)
    items.push(description)
    that.setData({
      items:items
    })
  },
  hideModify:function (){
    var that = this
    that.setData({
      is_modify: false,
      is_pwdmodify:false
    })
  },
  valueInput: function (e) {
    this.setData({
      value: e.detail.value
    });
  },
  modify_info:function(){
    var that = this
    var field = that.data.field
    var value = that.data.value
    if (value == '') {
      wx.showToast({
        title: '内容不能为空',
        icon: 'none',
        duration: 2000
      })
      return
    }
    this.confirm(field, value)
    var index = that.data.index
    var items = that.data.items
    items[index].value = value
    that.setData({
      is_modify: false,
      items: items
    })
  },
  modify_password: function (e){
    var that = this
    var user = app.user
    var field = 'password' 
    var old_pwd = e.detail.value.old_pwd;
    var new_pwd = e.detail.value.new_pwd; 
    var confirm_pwd = e.detail.value.confirm_pwd;
    if(old_pwd != user.password){
      wx.showToast({
        title: '旧密码不正确',
        icon: 'none',
        duration: 2000
      })
      return
    }
    if (new_pwd == ''){
      wx.showToast({
        title: '新密码不能为空',
        icon: 'none',
        duration: 2000
      })
      return
    }
    if (new_pwd != confirm_pwd) {
      wx.showToast({
        title: '两次输入的密码不一致',
        icon: 'none',
        duration: 2000
      })
      return
    }
    var value = new_pwd 
    this.confirm(field, value)
    that.setData({
      is_pwdmodify: false
    })
    
  },
  confirm: function (field, value){
    var that = this
    wx.request({
      method: 'post',
      data: {
        user: app.user,
        field: field,
        value: value
      },
      url: config.host + '/weapp/account_modify',
      success: function (res) {
        var status = res.data.data.status
        var user = res.data.data.user
        if (status && res.statusCode === 200 && res.data.code != -1) {
          app.user = user
          wx.showToast({
            title: '修改成功',
            icon: 'none',
            duration: 2000
          })
        }
      },
      fail: function (res) {
        wx.hideToast();
        that.setData({
          is_modify:false,
          is_pwdmodify: false
        })
        app.showErrorModal(res.errMsg, '服务器维护中');
      }
    })
  }
})