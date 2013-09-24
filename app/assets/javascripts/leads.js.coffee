# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
        $('.logo').click ->
                $('#new_lead #lead_phone').focus()
        $('#upper_order_btn').click (e)->
                e.preventDefault()
                e.stopPropagation()
                $('#new_lead #lead_phone').focus()
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
                                                phone:$("#new_lead #lead_phone").val()
                                                address:$("#lead_address").val()
                                                name:$("#lead_name").val()
                                                email:$("#lead_email").val()
                                                color:$("#lead_color").val()
                                                comments:$("#lead_comments").val()
                                                
                                success:(data,status,response)->
                                        if data is "success"
                                                yaCounter22285655.reachGoal('ORDER')
                                                $('#success_modal').modal('show')
                                        else
                                                $('#error_modal').modal('show')
                                error:->
                                        $('#error_modal').modal('show')


        $('#callback_modal input[type="submit"]').click (e)->
                e.preventDefault()
                e.stopPropagation()
                $.ajax
                        type:'POST'
                        contentType: 'application/json; charset=UTF-8'
                        url:'/leads'
                        data:
                                JSON.stringify lead:
                                        phone:$("#callback_modal #lead_phone").val()
                                                
                        success:(data,status,response)->
                                $('#callback_modal').modal('hide')
                                if data is "success"
                                        yaCounter22285655.reachGoal('ORDER')
                                        $('#callback_success_modal').modal('show') 
                                else
                                        $('#error_modal').modal('show')
                        error:->
                                $('#callback_modal').modal('hide')
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