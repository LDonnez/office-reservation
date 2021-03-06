// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require fullcalendar
//= require fullcalendar/gcal
//= require bootstrap
//= require select2
//= require bootstrap-datetimepicker
//= require_tree .

function init() {
  initializeDatePicker()
}

function initializeDatePicker() {
  var format = {format: 'DD-MM-YYYY HH:mm:ss'}
  $('#start_date_picker').datetimepicker(format)
  $('#end_date_picker').datetimepicker(format)
}

$(document).on('turbolinks:load', init);
