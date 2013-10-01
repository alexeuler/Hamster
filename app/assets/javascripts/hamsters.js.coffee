# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
        $('.logo').click ->
                $('#new_hamster #hamster_phone').focus()
        window.setInterval( ->
                deadline=$('#time_left').val()*1000
                left=deadline-Date.now()
                days=Math.floor(left/1000/60/60/24)
                hours=Math.floor(left/1000/60/60)-days*24
                minutes=Math.floor(left/1000/60)-(days*24+hours)*60
                seconds=Math.floor(left/1000)-((days*24+hours)*60+minutes)*60
                arr=$([days,hours,minutes,seconds]).map (i,e)->
                        if e < 10
                                e="0"+e
                        else
                                e
                $('.days').text arr[0]
                $('.hours').text arr[1]
                $('.minutes').text arr[2]
                $('.seconds').text arr[3]
        ,1000)
                

        $('#upper_order_btn').click (e)->
                e.preventDefault()
                e.stopPropagation()
                $('#new_hamster #hamster_phone').focus()
        $('#hamster_color').change ->
                $('#orange_hamster_image').toggleClass('hide')
                $('#blue_hamster_image').toggleClass('hide')
        $('#new_hamster input[type="submit"]').click (e)->
                e.preventDefault()
                e.stopPropagation()
                if $('#new_hamster').valid()
                        $.ajax
                                
                                type:'POST'
                                contentType: 'application/json; charset=UTF-8'
                                url:'/hamsters'
                                data:
                                        JSON.stringify hamster:
                                                phone:$("#new_hamster #hamster_phone").val()
                                                address:$("#hamster_address").val()
                                                name:$("#hamster_name").val()
                                                email:$("#hamster_email").val()
                                                color:$("#hamster_color").val()
                                                comments:$("#hamster_comments").val()
                                                
                                success:(data,status,response)->
                                        if data is "success"
                                                $('#success_modal').modal('show')
                                                yaCounter22285655.reachGoal('ORDER')
                                                _gaq.push(['_trackEvent', 'Order', 'Buy', ''])
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
                        url:'/hamsters'
                        data:
                                JSON.stringify hamster:
                                        phone:$("#callback_modal #hamster_phone").val()
                                                
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
                                
        $('#new_hamster').validate
                rules:
                        'hamster[phone]':
                                required:true
                        'hamster[email]':
                                email:true
                        'hamster[address]':
                                required:true
                        'hamster[name]':
                                required:true
                messages:
                        'hamster[phone]':
                                required:'Укажите, пожалуйста, номер телефона'
                        'hamster[email]':
                                email:'Неверный формат email'
                        'hamster[name]':
                                required:'Укажите, пожалуйста, имя'
                        'hamster[address]':
                                required:'Укажите, пожалуйста, адрес доставки'                                 