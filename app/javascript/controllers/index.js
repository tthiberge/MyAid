// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AppointmentController from "./appointment_controller"
application.register("appointment", AppointmentController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import FlatpickrPrescriptionController from "./flatpickr_prescription_controller"
application.register("flatpickr-prescription", FlatpickrPrescriptionController)

import FormController from "./form_controller"
application.register("form", FormController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InitTomSelectController from "./init_tom_select_controller"
application.register("init-tom-select", InitTomSelectController)

import UploadSelfyController from "./upload_selfy_controller"
application.register("upload-selfy", UploadSelfyController)
