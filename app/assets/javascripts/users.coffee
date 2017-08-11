jQuery ->
	$('form').on 'click', '.remove_fields', (event) ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('fieldset').hide()
		event.preventDefault()

jQuery ->
	$('.add_fields').on 'click', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()