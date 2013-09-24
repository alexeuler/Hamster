# -*- coding: utf-8 -*-
class InfoMailer < ActionMailer::Base
  default from: "info@homa-online.ru"

def new_lead(lead)
  @lead=lead
  mail(to:'info@homa-online.ru', subject:'Новый заказ')
end

def thank_you(to,name,sex)
  @name=name
  @sex=sex
  mail(to:'info@homa-online.ru', subject:'Спасибо за заказ!')
end
end
