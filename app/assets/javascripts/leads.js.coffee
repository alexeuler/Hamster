# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
        $('#upper_order_btn').click (e)->
                e.preventDefault()
                e.stopPropagation()
                $(document).scrollTop $("#decision_container").offset().top
        $('#lead_color').change ->
                $('#orange_hamster_image').toggleClass('hide')
                $('#blue_hamster_image').toggleClass('hide')
                        