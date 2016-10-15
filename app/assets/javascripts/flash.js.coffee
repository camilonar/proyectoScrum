#Esta funcion hace que las notificaciones se desvanezcan al inicio y al final
#Con esto las notificaciones no se quedan de forma permanente
jQuery ->

    $('#flash').hide().delay(800).fadeIn(800).delay(4000).fadeOut(800)