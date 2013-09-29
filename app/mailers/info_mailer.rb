# -*- coding: utf-8 -*-
class InfoMailer < ActionMailer::Base
  default from: "info@homa-online.ru"

def new_hamster(hamster)
  @hamster=hamster
  mail(to:'info@homa-online.ru', subject:'Новый заказ на Хомячка')
end

def thanks(to,name,sex)
  @name=name
  @sex=sex
  mail(to:to, subject:'Спасибо за заказ!')
end
end
