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
                e.preventDefault()
                e.stopPropagation()
                if $('#new_lead').valid()
                        $.ajax
                                
                                type:'POST'
                                contentType: 'application/json; charset=UTF-8'
                                url:'/leads'
                                data:
                                        JSON.stringify lead:
                                                phone:$("#lead_phone").val()
                                                address:$("#lead_address").val()
                                                name:$("#lead_name").val()
                                                email:$("#lead_email").val()
                                                color:$("#lead_color").val()
                                                comments:$("#lead_comments").val()
                                                
                                success:(data,status,response)->
                                        if data is "success"
                                                $('#success_modal').modal('show')
                                        else
                                                $('#error_modal').modal('show')
                                error:->
                                        $('#error_modal').modal('show')
                                                
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