# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
        $('#upper_order_btn').click (e)->
                e.preventDefault()
                e.stopPropagation()
                $('#lead_phone').focus()
        $('#lead_color').change ->
                $('#orange_hamster_image').toggleClass('hide')
                $('#blue_hamster_image').toggleClass('hide')
        $('#new_lead input[type="submit"]').click (e)->
                unless $('#new_lead').valid()
                        e.preventDefault
                        e.stopPropagation
                        
        $('#new_lead').validate
                rules:
                        'lead[phone]':
                                required:true
                        'lead[email]':
                                email:true
                        'lead[address]':
                                required:true
                        'lead[name]':
                                required:true
                messages:
                        'lead[phone]':
                                required:'Укажите, пожалуйста, номер телефона'
                        'lead[email]':
                                email:'Неверный формат email'
                        'lead[name]':
                                required:'Укажите, пожалуйста, имя'
                        'lead[address]':
                                required:'Укажите, пожалуйста, адрес доставки'                                 