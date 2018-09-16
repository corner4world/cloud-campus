var WxSearch = require('../../utils/wxSearchView/wxSearchView.js');
var wxSortPickerView = require('../../utils/wxSortPickerView/wxSortPickerView.js');
var config = require('../../config')
var app = getApp();
Page({
  data: {
    phones: [],
    current:"teacher",
  },
  call:function(e){
    var phone = e.target.id;
    //var name = e.target.dataset.text;
    //todo 取消提示
    wx.makePhoneCall({
      phoneNumber: phone,
    })
  },
  onChange(e) {
    this.setData({
      current: e.detail.key,
    })
    var current = this.data.current
    this.fetch_phone(current)
    
  },
  onLoad: function (options) {
    this.fetch_phone("teacher")
  },
  fetch_phone:function(current){
    var that = this;
    wx.getStorage({
      key: current+'_phones',
      success: function(res) {
        app.showLoadToast('加载中');
        var phones = res.data
        WxSearch.init(
          that,
          [],
          phones,// 搜索匹配，[]表示不使用
          that.mySearchFunction, // 提供一个搜索回调函数
          that.myGobackFunction //提供一个返回回调函数
        );
        //电话列表初始化
        wxSortPickerView.init(phones, that);
        wx.hideToast();
      },
      fail:function(){
        that.feachData(current)
      }
    })
  },
  feachData:function(current) {
    var that = this;
    var user_type = 1
    if (current == "parent") {
      user_type = 2
    }
    app.showLoadToast('加载中');
    wx.request({
      method: 'post',
      data: {
        user_type: user_type,
        user: app.user,
        level: app.level
      },
      url: config.host + '/weapp/phone',
      success: function (res) {
        var phones = res.data.data.result
        if (phones.length && res.statusCode === 200) {
          that.setData({
            phones: phones
          })
          wx.setStorage({
            key: current + '_phones',
            data: phones,
          })
        } else if (phones.length == 0 && res.statusCode === 200) {
          that.setData({
            phones: phones
          })
          wx.showToast({
            title: '暂未录入电话',
            icon: 'none',
            duration: 2000
          })
        }
        WxSearch.init(
          that,
          [],
          phones,// 搜索匹配，[]表示不使用
          that.mySearchFunction, // 提供一个搜索回调函数
          that.myGobackFunction //提供一个返回回调函数
        );
        //电话列表初始化
        wxSortPickerView.init(phones, that);
        wx.hideToast();
      },
      fail: function (res) {
        wx.hideToast();
        app.showErrorModal(res.errMsg, '服务器维护中');
      }
    })
  },
  // 转发函数,固定部分
  wxSearchInput: WxSearch.wxSearchInput,  // 输入变化时的操作
  wxSearchKeyTap: WxSearch.wxSearchKeyTap,  // 点击提示或者关键字、历史记录时的操作
  wxSearchConfirm: WxSearch.wxSearchConfirm,  // 搜索函数
  wxSearchClear: WxSearch.wxSearchClear,  // 清空函数
})