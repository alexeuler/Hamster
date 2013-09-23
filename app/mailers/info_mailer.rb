# -*- coding: utf-8 -*-
class InfoMailer < ActionMailer::Base
  default from: "info@homa-online.ru"

def new_lead(lead)
  @lead=lead
  mail(to:'info@homa-online.ru', subject:'Новый заказ')
end
end
